# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1






typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;


typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
void waitForVBlank();
# 64 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 80 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 112 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 164 "gba.h"
# 1 "mode0.h" 1



# 1 "gba.h" 1
# 5 "mode0.h" 2
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 165 "gba.h" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int fightx;
    int fighty;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
    int health;
    int cheat;
} SPRITE;
# 166 "gba.h" 2
# 2 "main.c" 2
# 1 "game.h" 1
# 13 "game.h"
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void movePlayer();
void animatePlayer(SPRITE *sprite);
void drawPlayer();
void drawHealth();
void updateHealth();
void drawArrows();
void moveArrows();
int canMoveLeft(SPRITE *sprite, int x, int y);
int canMoveRight(SPRITE *sprite, int x, int y);
int canMoveUp(SPRITE *sprite, int x, int y);
int canMoveDown(SPRITE *sprite, int x, int y);
void shootArrow(int cheat);

void checkArrowCollision(SPRITE *sprite);
int newArrow;

extern SPRITE arrows[5];

extern SPRITE harpies[5];

extern unsigned char* collisionMap;

extern int mapState;
extern int fightingharpies;
extern int fightingMinotaur;
extern int fightingSkeletons;
extern int collisionsEnabled;
extern int passed1;
extern int passed2;
extern int passed3;

extern int hOff;
extern int vOff;

extern int health;
extern int healthCountdown;
extern int cheat;


extern int minute;
extern int second;
# 3 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 4 "main.c" 2
# 1 "fight1.h" 1
# 11 "fight1.h"
void initFight1();
void updateFight1();
void drawFight1();
void initHarpies();
void moveHarpies();
void drawHarpies();
void checkCollision();
void exitFight1();


extern SPRITE harpies[5];
# 5 "main.c" 2
# 1 "fight2.h" 1
# 21 "fight2.h"
void initFight2();
void updateFight2();
void drawFight2();
void initMinotaur();
void moveMinotaur();
void drawMinotaur();
void checkCollision2();
void drawPlayerFightingMinotaur();

void movePlayerF2();
void animateEnemy(SPRITE *sprite);
void exitFight2();
# 6 "main.c" 2
# 1 "fight3.h" 1
# 11 "fight3.h"
void initFight3();
void updateFight3();
void drawFight3();
void initHarpies();
void moveHarpies();
void drawHarpies();
void checkSkeletonCollision();
void exitFight3();


extern SPRITE skeletons[3];
# 7 "main.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 8 "main.c" 2
# 28 "main.c"
# 1 "tilemap.h" 1








# 8 "tilemap.h"
extern const unsigned short tilemapMap[4096];
# 29 "main.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[20480];


extern const unsigned short tilesetPal[256];
# 30 "main.c" 2
# 1 "lavabgTileset.h" 1
# 21 "lavabgTileset.h"
extern const unsigned short lavabgTilesetTiles[12800];


extern const unsigned short lavabgTilesetPal[256];
# 31 "main.c" 2
# 1 "lavabg.h" 1
# 22 "lavabg.h"
extern const unsigned short lavabgTiles[368];


extern const unsigned short lavabgMap[2048];


extern const unsigned short lavabgPal[256];
# 32 "main.c" 2
# 1 "lava.h" 1







extern const unsigned short lavaMap[2048];
# 33 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 34 "main.c" 2
# 1 "sp2.h" 1
# 21 "sp2.h"
extern const unsigned short sp2Tiles[16384];


extern const unsigned short sp2Pal[256];
# 35 "main.c" 2
# 1 "sp3.h" 1
# 21 "sp3.h"
extern const unsigned short sp3Tiles[16384];


extern const unsigned short sp3Pal[256];
# 36 "main.c" 2
# 1 "fightbg.h" 1







extern const unsigned short fightbgMap[1024];
# 37 "main.c" 2
# 1 "fight2bg.h" 1







extern const unsigned short fight2bgMap[1024];
# 38 "main.c" 2
# 1 "fight3bg.h" 1







extern const unsigned short fight3bgMap[2048];
# 39 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[12112];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 40 "main.c" 2

# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();



typedef struct {

    unsigned int sampleRate;
    unsigned int length;
    signed char* data;

} SONG;

SONG songs[2];

void initSongs();
void playSong(int);
extern int currTheme;
# 65 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 42 "main.c" 2
# 1 "walk.h" 1


extern const unsigned int walk_sampleRate;
extern const unsigned int walk_length;
extern const signed char walk_data[];
# 43 "main.c" 2
# 1 "collide.h" 1


extern const unsigned int collide_sampleRate;
extern const unsigned int collide_length;
extern const signed char collide_data[];
# 44 "main.c" 2



# 1 "screenMaps.h" 1
# 1 "instructionScreen.h" 1
# 20 "instructionScreen.h"
extern const unsigned short instructionScreenBitmap[38400];
# 2 "screenMaps.h" 2
# 1 "instructionScreen2.h" 1
# 20 "instructionScreen2.h"
extern const unsigned short instructionScreen2Bitmap[38400];
# 3 "screenMaps.h" 2
# 1 "instructionScreen3.h" 1
# 20 "instructionScreen3.h"
extern const unsigned short instructionScreen3Bitmap[38400];
# 4 "screenMaps.h" 2
# 1 "startScreen.h" 1
# 22 "startScreen.h"
extern const unsigned short startScreenTiles[7680];


extern const unsigned short startScreenMap[1024];


extern const unsigned short startScreenPal[256];
# 5 "screenMaps.h" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[7760];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 6 "screenMaps.h" 2
# 1 "loseScreen.h" 1
# 22 "loseScreen.h"
extern const unsigned short loseScreenTiles[7872];


extern const unsigned short loseScreenMap[1024];


extern const unsigned short loseScreenPal[256];
# 7 "screenMaps.h" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winScreenTiles[7680];


extern const unsigned short winScreenMap[1024];


extern const unsigned short winScreenPal[256];
# 7 "screenMaps.h" 2
# 48 "main.c" 2
# 1 "list.h" 1



typedef struct screen {





 const unsigned short* bitmap;

} SCREEN;


typedef struct dlnode {
 struct dlnode* prev;
 struct dlnode* next;
 SCREEN screen;
} NODE;


typedef struct dllist {
 struct dlnode *head;
 struct dlnode *tail;
} LIST;



LIST* createList();
void pushBack(LIST *dllist, SCREEN screen);
# 49 "main.c" 2

int currScreen;

# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[131072];


extern const unsigned short collisionmapPal[256];
# 53 "main.c" 2
# 1 "fight3collision.h" 1
# 21 "fight3collision.h"
extern const unsigned short fight3collisionBitmap[65536];


extern const unsigned short fight3collisionPal[256];
# 54 "main.c" 2

LIST* screensList;
NODE* currentNode;

void setupInterrupts();
void interruptHandler();

void initialize();

void goToStart();
void goToInstructions();
void instructions();
void start();
void goToGame();
void game();
void goToFight1();
void fight1();
void goToFight2();
void fight2();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

int hOff;
int vOff;
int mapState;
int fightingharpies;
int fightingMinotaur;
int fightingSkeletons;
int collisionsEnabled;
int passed1;
int passed2;
int passed3;
int cheat;
int seed;
int currTheme;

enum {START, INSTRUCTIONS, PAUSE, GAME, FIGHT1, FIGHT2,FIGHT3, WIN, LOSE};
int state;

OBJ_ATTR shadowOAM[128];
SPRITE player;

unsigned short oldButtons;
unsigned short buttons;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case PAUSE:
                pause();
                break;
            case GAME:
                game();
                break;
            case FIGHT1:
                fight1();
                break;
            case FIGHT2:
                fight2();
                break;
            case FIGHT3:
                fight3();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }


    }
}


void initialize() {


    mgba_open();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) |(1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((28) << 8) | (3 << 14);

    (*(volatile unsigned short*)0x400000A) = ((0) << 2) | ((26) << 8) | (1 << 14);



    currTheme = 0;
    passed1 = 0;
    passed2 = 0;
    passed3 = 0;
    player.health = 100;
    mapState = 1;
    fightingharpies = 0;
    fightingMinotaur = 0;
    fightingSkeletons = 0;
    setupSounds();
    initSongs();
    setupInterrupts();





    goToStart();
}

void setupInterrupts() {

 *(unsigned short*)0x4000208 = 0;

    *(unsigned short*)0x4000200 = (1 << 0) | (1 << ((2 % 4) + 3)) | (1 << ((3 % 4) + 3));
    *(unsigned short*)0x4000004 = (1 << 3);

    *((ihp*)0x03007FFC) = &interruptHandler;

 *(unsigned short*)0x4000208 = 1;

}

void interruptHandler() {

 *(unsigned short*)0x4000208 = 0;

 if (*(volatile unsigned short*)0x4000202 & (1 << 0)) {
        if (soundA.isPlaying) {
            soundA.vBlankCount += 1;
            if(soundA.vBlankCount >= soundA.durationInVBlanks) {
                if(soundA.looping) {
                    playSong(currTheme);


                } else {
                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
                    dma[1].cnt = 0;
                }
            }

        }

        if (soundB.isPlaying) {
            soundB.vBlankCount += 1;
            if(soundB.vBlankCount >= soundB.durationInVBlanks) {
                if(soundB.looping) {
                    playSoundB(soundB.data,soundB.dataLength,soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                    dma[2].cnt = 0;
                }
            }

  }

 }

    if (*(volatile unsigned short*)0x4000202 & (1 << ((2 % 4) + 3))) {
        second = (second + 1) % 60;
    }

    if (*(volatile unsigned short*)0x4000202 & (1 << ((3 % 4) + 3))) {
        minute = (minute + 1) % 100;
    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
    *(unsigned short*)0x4000208 = 1;

}

void goToStart(){

    pauseSounds();
    (*(volatile unsigned short*)0x4000008) = (0 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, startScreenTiles, &((charblock *)0x06000000)[0], sizeof(startScreenTiles) / 2);
    DMANow(3, startScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, startScreenMap, &((screenblock *)0x6000000)[28], 2048/ 2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    waitForVBlank();
    state = START;

}

void start() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        unpauseSounds();
        goToGame();
        initGame();

    }
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        goToInstructions();
    }
}

void goToInstructions(){

    pauseSounds();
    currScreen = 0;
    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | (1 << (8 + (2 % 4)));





    screensList = createList();
    pushBack(screensList, (SCREEN) {.bitmap = instructionScreenBitmap });
    pushBack(screensList, (SCREEN) {.bitmap = instructionScreen2Bitmap });
    pushBack(screensList, (SCREEN) {.bitmap = instructionScreen3Bitmap });
    currentNode = screensList->head;




    drawCurrentScreen();


    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    waitForVBlank();
    state = INSTRUCTIONS;

}

void instructions() {

    if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5))))) {
            if (currentNode->prev != 
# 302 "main.c" 3 4
                                    ((void *)0)
# 302 "main.c"
                                        ) {

                currentNode= currentNode->prev;
            }
            drawCurrentScreen();
        }
        if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4))))) {
            if (currentNode->next != 
# 309 "main.c" 3 4
                                    ((void *)0)
# 309 "main.c"
                                        ) {

                currentNode = currentNode->next;
            }
            drawCurrentScreen();
        }
# 330 "main.c"
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        if(mapState) {
            unpauseSounds();
            goToGame();
        } else if(fightingharpies) {
            unpauseSounds();
            goToFight1();
        } else if(fightingMinotaur) {
            unpauseSounds();
            goToFight2();
        } else if(fightingSkeletons) {
            unpauseSounds();
            goToFight3();
        }
    } else if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        initialize();
# 355 "main.c"
    }
}

void drawCurrentScreen() {
    waitForVBlank();
    DMANow(3, currentNode->screen.bitmap,videoBuffer, 240 * 160);
# 375 "main.c"
}

void goToPause() {
    pauseSounds();

    (*(volatile unsigned short*)0x4000008) = (0 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, pauseScreenTiles, &((charblock *)0x06000000)[0], sizeof(pauseScreenTiles) / 2);
    DMANow(3, pauseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseScreenMap, &((screenblock *)0x6000000)[28], 2048/ 2);


    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    waitForVBlank();
    state = PAUSE;
}

void pause(){
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        if(mapState) {
            unpauseSounds();
            goToGame();
        } else if(fightingharpies) {
            unpauseSounds();
            goToFight1();
        } else if(fightingMinotaur) {
            unpauseSounds();
            goToFight2();
        } else if(fightingSkeletons) {
            unpauseSounds();
            goToFight3();
        }
    } else if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        initialize();
# 419 "main.c"
    }

}

void goToGame() {
    currTheme = 0;
    playSong(currTheme);
    waitForVBlank();

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) |(1 << 12);
    (*(volatile unsigned short*)0x4000008) = (3 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
    DMANow(3, tilemapMap, &((screenblock *)0x6000000)[28], (8192) / 2);

    collisionMap = (unsigned char*) collisionmapBitmap;


    DMANow(3, spritesheetTiles, &((charblock *)0x06000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((u16 *)0x5000200), 512 / 2);




    DMANow(3, lavaMap, &((screenblock *)0x6000000)[26], (4096) / 2);





    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    waitForVBlank();

    state = GAME;

}

void game() {
    updateGame();

    drawGame();
    if(player.health < 1 ){
        goToLose();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        goToInstructions();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        initialize();
# 480 "main.c"
    }
}

void goToFight1() {
    currTheme = 1;
    playSong(currTheme);
    waitForVBlank();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) |(1 << 12);
    (*(volatile unsigned short*)0x4000008) = (0 << 14) | ((0) << 2) | ((28) << 8);

    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
    DMANow(3, fightbgMap, &((screenblock *)0x6000000)[28], (2048) / 2);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    if(!fightingharpies) {
        initFight1();
    }
    waitForVBlank();


    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    state = FIGHT1;

}

void fight1() {
    updateFight1();

    drawFight1();

    if(player.health < 1 ){
        goToLose();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        goToInstructions();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        initialize();
# 532 "main.c"
    }
}


void goToFight2() {
    currTheme = 1;
    playSong(currTheme);
    waitForVBlank();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) |(1 << 12);
    (*(volatile unsigned short*)0x4000008) = (0 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
    DMANow(3, fight2bgMap, &((screenblock *)0x6000000)[28], (2048) / 2);

    DMANow(3, sp2Tiles, &((charblock *)0x06000000)[4], 32768 / 2);
    DMANow(3, sp2Pal, ((u16 *)0x5000200), 512 / 2);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    if(!fightingMinotaur) {
        initFight2();
    }
    state = FIGHT2;
}

void fight2() {
    updateFight2();

    drawFight2();

    if(player.health < 1 ){
        goToLose();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        goToInstructions();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        initialize();
# 584 "main.c"
    }
}

void goToFight3() {
    currTheme = 1;
    playSong(currTheme);
    waitForVBlank();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) |(1 << 12);
    (*(volatile unsigned short*)0x4000008) = (2 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
    DMANow(3, fight3bgMap, &((screenblock *)0x6000000)[28], (4096) / 2);
    DMANow(3, sp3Tiles, &((charblock *)0x06000000)[4], 32768 / 2);
    DMANow(3, sp3Pal, ((u16 *)0x5000200), 512 / 2);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    if(!fightingSkeletons) {

        initFight3();
    }
    state = FIGHT3;
}

void fight3() {
    updateFight3();

    drawFight3();

    if(player.health < 1 ){
        goToLose();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        goToInstructions();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        initialize();
# 636 "main.c"
    }
}

void goToWin() {
    pauseSounds();
    (*(volatile unsigned short*)0x4000008) = (0 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, winScreenTiles, &((charblock *)0x06000000)[0], sizeof(winScreenTiles) / 2);
    DMANow(3, winScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, winScreenMap, &((screenblock *)0x6000000)[28], 2048/ 2);


    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    hideSprites();

    state = WIN;
}

void win(){
    if((~(buttons) & ((1<<3)))){
        initialize();
# 665 "main.c"
    }

}

void goToLose() {
    pauseSounds();
    (*(volatile unsigned short*)0x4000008) = (0 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, loseScreenTiles, &((charblock *)0x06000000)[0], sizeof(loseScreenTiles) / 2);
    DMANow(3, loseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseScreenMap, &((screenblock *)0x6000000)[28], 2048/ 2);


    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = LOSE;
}

void lose(){
    if((~(buttons) & ((1<<3)))){
        initialize();
# 695 "main.c"
    }
}
