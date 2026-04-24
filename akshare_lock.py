"""
共享线程锁模块
保护 akshare API 调用，防止多线程环境下 Python 解释器崩溃

问题背景：
akshare 库使用 C 扩展，在多线程环境下调用时可能导致 Python 解释器
字节码损坏，出现 "unknown opcode" 错误，造成进程静默终止。

解决方案：
所有 akshare API 调用必须通过此锁进行同步，确保同一时间只有一个线程
在执行 akshare 相关操作。
"""

import threading

# 全局线程锁，保护所有 akshare API 调用
akshare_lock = threading.Lock()

def get_akshare_lock():
    """获取 akshare 线程锁"""
    return akshare_lock
