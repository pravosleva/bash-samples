#!bin/bash

BACKEND_DIR="${PWD}/backend"
UPLOADS_DIR="${BACKEND_DIR}/uploads"
# EXTERNAL_UPLOADS_DIR="${PWD}/uploads"
EXTERNAL_DIR=""$(dirname "$PWD")""
EXTERNAL_UPLOADS_DIR="${EXTERNAL_DIR}/uploads"

# 0. Create extenal dir if necessary:
if [ -d $EXTERNAL_UPLOADS_DIR ]
then
  echo "  EXISTS: $EXTERNAL_UPLOADS_DIR"
else
  mkdir $EXTERNAL_UPLOADS_DIR
fi

# 1. Скопировать содержимое /uploads/* во внешнюю папку ../../uploads:
echo "1/3. Copy /uploads to external dir"
if [ -d $UPLOADS_DIR ]
then
  if [ -d $EXTERNAL_UPLOADS_DIR ]
  then
    echo "  BTW: В текущей папке есть /uploads (копирование не будет отменено)"
  fi
  cp -r $UPLOADS_DIR/* $EXTERNAL_UPLOADS_DIR
  echo "  backend/uploads copied to $EXTERNAL_UPLOADS_DIR"
else
  echo "  WTF? Directory $BACKEND_DIR does not exists."
fi

# 2. Удалить /backend/uploads
rm -rf $UPLOADS_DIR
echo "2/3. $UPLOADS_DIR removed."

# 3. Скопировать обратно после front side building:
echo "3/3. Moving back..."
if [ -d $EXTERNAL_UPLOADS_DIR ]
then
  echo "  Как ожидалось, $EXTERNAL_UPLOADS_DIR существует"

  cp -r $EXTERNAL_UPLOADS_DIR $BACKEND_DIR
else
  echo "  >##> WTF? $EXTERNAL_UPLOADS_DIR не существует!"
fi
