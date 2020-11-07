package terminal

import (
	"fmt"
	"os"
	"sync"
	"time"

	"github.com/mattn/go-tty"
	"golang.org/x/sys/unix"
)
