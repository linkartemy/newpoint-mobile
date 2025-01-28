.PHONY: all proto clean

OUT_DIR := lib/src/generated
PROTO_DIR := lib/protos
PROTO_FILES := $(wildcard $(PROTO_DIR)/*.proto) google/protobuf/any.proto google/protobuf/timestamp.proto google/protobuf/struct.proto

all: proto

proto:
	@if not exist "$(OUT_DIR)" mkdir "$(OUT_DIR)"
	protoc --dart_out=grpc:$(OUT_DIR) -I$(PROTO_DIR) $(PROTO_FILES)

clean:
	if exist "$(OUT_DIR)" rmdir /s /q "$(OUT_DIR)"
