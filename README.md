# DefaceIT

[راهنمای فارسی](#defaceit-فارسی) | [Persian Guide](#defaceit-فارسی)

DefaceIT is a cross-platform GUI application for blurring faces and license plates in videos using YOLOv11. The app supports both English and Persian languages.

## Features

- Easy to use graphical interface
- Fast processing with GPU acceleration support (CUDA, MPS, CPU)
- Accurate detection using YOLOv11-based face and license plate detection
- Audio preservation with automatic audio merging
- Audio pitch shifting with preview functionality
- Cross-platform support (macOS, Linux, Windows)
- Bilingual interface (English and Persian)
- Customizable settings (blur strength, confidence, blur type)

## Requirements

- Python 3.8 or higher
- ffmpeg (for audio preservation)
  - macOS: `brew install ffmpeg`
  - Linux: `sudo apt-get install ffmpeg` (Ubuntu/Debian) or `sudo yum install ffmpeg` (RHEL/CentOS)
  - Windows: Download from [ffmpeg.org](https://ffmpeg.org/download.html)

## Installation

### macOS / Linux

1. Open Terminal
2. Navigate to the faceblur_app directory:
   ```bash
   cd faceblur_app
   ```
3. Run the setup script:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```
4. Run the application:
   ```bash
   python run.py
   ```

The `run.py` script will automatically:
- Detect your operating system
- Use the virtual environment if available
- Fall back to system Python if needed
- Handle tkinter detection and errors

### Windows

1. Open Command Prompt or PowerShell
2. Navigate to the faceblur_app directory:
   ```cmd
   cd faceblur_app
   ```
3. Run the setup script:
   ```cmd
   setup.bat
   ```
4. Run the application:
   ```cmd
   python run.py
   ```

The `run.py` script will automatically:
- Detect your operating system
- Use the virtual environment if available
- Fall back to system Python if needed
- Handle tkinter detection and errors

## Usage

1. Launch the application using the instructions above
2. Click "Browse..." next to "Input Video" to select your video file
3. Optionally set the output location (auto-generated if not set)
4. Adjust settings:
   - **Blur Strength**: Higher values = more blur (21-101)
   - **Confidence**: Lower values = more detections (0.05-0.5)
   - **Blur Type**: Gaussian or Pixelate
   - **Detect**: Choose faces and/or license plates
   - **Device**: Auto-detect, CPU, or GPU
   - **Audio Pitch Shift**: Adjust pitch in semitones (-12 to +12)
5. Click "Preview Audio" to test the pitch shift (optional)
6. Click "Start Processing"
7. Wait for processing to complete
8. Your blurred video will be saved with audio preserved

## Building Standalone Executable

### Using PyInstaller

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --name DefaceIT defaceit_gui.py
```

The executable will be in the `dist` folder.

## Troubleshooting

### Tkinter Not Found Error

If you see: `ModuleNotFoundError: No module named '_tkinter'`

**macOS Solutions:**
- Option 1: Use System Python (Recommended)
  ```bash
  /usr/bin/python3 defaceit_gui.py
  ```
- Option 2: Install python-tk for Homebrew Python
  ```bash
  brew install python-tk
  ```
- Option 3: Use the macOS launcher script
  ```bash
  ./run_macos.sh
  ```

**Linux Solutions:**
```bash
# Ubuntu/Debian
sudo apt-get install python3-tk

# RHEL/CentOS/Fedora
sudo yum install python3-tk
# or
sudo dnf install python3-tk
```

**Windows Solutions:**
Tkinter should be included with Python. If not:
1. Reinstall Python from python.org
2. Make sure "tcl/tk and IDLE" is checked during installation

### Virtual Environment Issues

If tkinter doesn't work in your venv:

**Option 1: Use system Python directly**
```bash
python3 defaceit_gui.py
```

**Option 2: Install dependencies globally (not recommended)**
```bash
pip3 install -r requirements.txt
python3 defaceit_gui.py
```

### Other Common Issues

- **No audio in output**: Make sure ffmpeg is installed and in your PATH
- **Slow processing**: Try using GPU acceleration or lower video resolution
- **Missing faces**: Lower the confidence threshold (try 0.1)
- **Too much blur**: Reduce blur strength
- **App runs but is slow**: Make sure GPU acceleration is enabled (select "Auto" or "GPU" in device settings)
- **Faces not being detected**: Lower the confidence threshold, increase blur strength for better coverage, make sure "Detect Faces" is checked
- **librosa not installed**: Run `pip install librosa soundfile` for audio pitch shifting features

## Notes

- First run will download YOLOv11n model (~5.4MB)
- Processing speed depends on your hardware (GPU recommended)
- Audio preservation requires ffmpeg to be installed
- Large videos may take some time to process

## Credits

**Developer:** [Shin](https://x.com/hey_itsmyturn)

- **X (Twitter):** [@hey_itsmyturn](https://x.com/hey_itsmyturn)
- **Website:** [https://sh1n.org](https://sh1n.org)
- **Telegram:** [https://t.me/itsthealephyouknowfromtwitter](https://t.me/itsthealephyouknowfromtwitter)

### Support the Developer

- **Donate (Crypto):** [https://nowpayments.io/donation/shin](https://nowpayments.io/donation/shin)
- **Donate (Card):** [https://buymeacoffee.com/hey_itsmyturn](https://buymeacoffee.com/hey_itsmyturn)

**Note:** Translation and Readme was generated by Cursor AI

---

# DefaceIT (فارسی) {#defaceit-فارسی}

DefaceIT یک برنامه گرافیکی چند پلتفرمی برای تار کردن چهره‌ها و پلاک‌ها در ویدیوها با استفاده از YOLOv11 است. این برنامه از زبان‌های انگلیسی و فارسی پشتیبانی می‌کند.

## ویژگی‌ها

- رابط گرافیکی ساده
- پردازش سریع با پشتیبانی از شتاب GPU (CUDA, MPS, CPU)
- تشخیص دقیق با استفاده از YOLOv11
- حفظ صدا با ادغام خودکار صدا
- تغییر زیر و بم صدا با قابلیت پیش‌نمایش
- پشتیبانی از چند پلتفرم (macOS, Linux, Windows)
- رابط دو زبانه (انگلیسی و فارسی)
- تنظیمات قابل تنظیم

## نیازمندی‌ها

- Python 3.8 یا بالاتر
- ffmpeg (برای حفظ صدا)
  - macOS: `brew install ffmpeg`
  - Linux: `sudo apt-get install ffmpeg` (Ubuntu/Debian) یا `sudo yum install ffmpeg` (RHEL/CentOS)
  - Windows: از [ffmpeg.org](https://ffmpeg.org/download.html) دانلود کنید

## نصب

### macOS / Linux

1. Terminal را باز کنید
2. به پوشه faceblur_app بروید:
   ```bash
   cd faceblur_app
   ```
3. اسکریپت نصب را اجرا کنید:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```
4. برنامه را اجرا کنید:
   ```bash
   python run.py
   ```

اسکریپت `run.py` به صورت خودکار:
- سیستم عامل شما را تشخیص می‌دهد
- در صورت وجود از محیط مجازی استفاده می‌کند
- در صورت نیاز به Python سیستم بازمی‌گردد
- تشخیص tkinter و خطاها را مدیریت می‌کند

### Windows

1. Command Prompt یا PowerShell را باز کنید
2. به پوشه faceblur_app بروید:
   ```cmd
   cd faceblur_app
   ```
3. اسکریپت نصب را اجرا کنید:
   ```cmd
   setup.bat
   ```
4. برنامه را اجرا کنید:
   ```cmd
   python run.py
   ```

اسکریپت `run.py` به صورت خودکار:
- سیستم عامل شما را تشخیص می‌دهد
- در صورت وجود از محیط مجازی استفاده می‌کند
- در صورت نیاز به Python سیستم بازمی‌گردد
- تشخیص tkinter و خطاها را مدیریت می‌کند

## استفاده

1. برنامه را با دستورالعمل‌های بالا اجرا کنید
2. روی "مرور..." کنار "ویدیوی ورودی" کلیک کنید تا فایل ویدیوی خود را انتخاب کنید
3. به صورت اختیاری مکان خروجی را تنظیم کنید (در صورت عدم تنظیم، به صورت خودکار تولید می‌شود)
4. تنظیمات را تنظیم کنید:
   - **قدرت تار کردن**: مقادیر بالاتر = تار بیشتر (21-101)
   - **اعتماد**: مقادیر پایین‌تر = تشخیص بیشتر (0.05-0.5)
   - **نوع تار کردن**: گاوسی یا پیکسلی
   - **تشخیص**: چهره‌ها و/یا پلاک‌ها را انتخاب کنید
   - **دستگاه**: خودکار، CPU، یا GPU
   - **تغییر زیر و بم صدا**: زیر و بم را در نیم‌پرده تنظیم کنید (-12 تا +12)
5. روی "پیش‌نمایش صدا" کلیک کنید تا تغییر زیر و بم را تست کنید (اختیاری)
6. روی "شروع پردازش" کلیک کنید
7. منتظر بمانید تا پردازش کامل شود
8. ویدیوی تار شده شما با صدا حفظ شده ذخیره می‌شود

## ساخت فایل اجرایی مستقل

### استفاده از PyInstaller

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --name DefaceIT defaceit_gui.py
```

فایل اجرایی در پوشه `dist` خواهد بود.

## عیب‌یابی

### خطای Tkinter پیدا نشد

اگر این خطا را می‌بینید: `ModuleNotFoundError: No module named '_tkinter'`

**راه‌حل‌های macOS:**
- گزینه 1: استفاده از Python سیستم (توصیه می‌شود)
  ```bash
  /usr/bin/python3 defaceit_gui.py
  ```
- گزینه 2: نصب python-tk برای Homebrew Python
  ```bash
  brew install python-tk
  ```
- گزینه 3: استفاده از اسکریپت راه‌انداز macOS
  ```bash
  ./run_macos.sh
  ```

**راه‌حل‌های Linux:**
```bash
# Ubuntu/Debian
sudo apt-get install python3-tk

# RHEL/CentOS/Fedora
sudo yum install python3-tk
# یا
sudo dnf install python3-tk
```

**راه‌حل‌های Windows:**
Tkinter باید با Python همراه باشد. اگر نیست:
1. Python را از python.org دوباره نصب کنید
2. مطمئن شوید "tcl/tk and IDLE" در طول نصب انتخاب شده است

### مشکلات محیط مجازی

اگر tkinter در venv شما کار نمی‌کند:

**گزینه 1: استفاده مستقیم از Python سیستم**
```bash
python3 defaceit_gui.py
```

**گزینه 2: نصب وابستگی‌ها به صورت سراسری (توصیه نمی‌شود)**
```bash
pip3 install -r requirements.txt
python3 defaceit_gui.py
```

### مشکلات رایج دیگر

- **بدون صدا در خروجی**: مطمئن شوید ffmpeg نصب شده و در PATH است
- **پردازش کند**: از شتاب GPU استفاده کنید یا وضوح ویدیو را کاهش دهید
- **چهره‌های از دست رفته**: آستانه اعتماد را کاهش دهید (0.1 را امتحان کنید)
- **تار بیش از حد**: قدرت تار کردن را کاهش دهید
- **برنامه کند اجرا می‌شود**: مطمئن شوید شتاب GPU فعال است (در تنظیمات دستگاه "Auto" یا "GPU" را انتخاب کنید)
- **چهره‌ها تشخیص داده نمی‌شوند**: آستانه اعتماد را کاهش دهید، قدرت تار کردن را برای پوشش بهتر افزایش دهید، مطمئن شوید "تشخیص چهره‌ها" انتخاب شده است
- **librosa نصب نشده**: برای ویژگی‌های تغییر زیر و بم صدا `pip install librosa soundfile` را اجرا کنید

## یادداشت‌ها

- اولین اجرا مدل YOLOv11n را دانلود می‌کند (~5.4MB)
- سرعت پردازش به سخت‌افزار شما بستگی دارد (GPU توصیه می‌شود)
- حفظ صدا نیاز به نصب ffmpeg دارد
- ویدیوهای بزرگ ممکن است زمان زیادی ببرد

## Credits

**توسعه‌دهنده:** [Shin](https://x.com/hey_itsmyturn)

- **X (توییتر):** [@hey_itsmyturn](https://x.com/hey_itsmyturn)
- **وب‌سایت:** [https://sh1n.org](https://sh1n.org)
- **تلگرام:** [https://t.me/itsthealephyouknowfromtwitter](https://t.me/itsthealephyouknowfromtwitter)

### حمایت از توسعه‌دهنده

- **حمایت (ارز دیجیتال):** [https://nowpayments.io/donation/shin](https://nowpayments.io/donation/shin)
- **حمایت (کارت):** [https://buymeacoffee.com/hey_itsmyturn](https://buymeacoffee.com/hey_itsmyturn)

**یادداشت:** ترجمه و راهنما توسط Cursor AI تولید شده است
