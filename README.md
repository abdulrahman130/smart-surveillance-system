# 🛡️ نظام المراقبة الذكي

نظام مراقبة ذكي يستخدم الذكاء الاصطناعي للكشف عن الأشخاص المطلوبين عبر تحليل الفيديو المباشر والمسجل.

## 📋 المميزات

- **كشف وتتبع الأشخاص** باستخدام YOLOv8
- **التعرف على الوجوه** باستخدام InsightFace
- **إدارة قاعدة بيانات المطلوبين**
- **لوحة تحكم تفاعلية** باستخدام Streamlit
- **واجهة برمجة متكاملة** باستخدام Django
- **إشعارات فورية**  اكتشاف مطلوبين

## 🏗️ هيكل المشروع
SMART_SURVEILLANCE_SYSTEM/
│
├── 📁 backend/                          # [الشخص ج + فريق Backend]
│   │
│   ├── 📁 config/                       # إعدادات Django
│   │   ├── __init__.py
│   │   ├── settings.py                  # الإعدادات الرئيسية
│   │   ├── urls.py                      # Routes الرئيسية
│   │   ├── asgi.py                      # لـ WebSocket (Django Channels)
│   │   └── wsgi.py
│   │
│   ├── 📁 apps/                         # تطبيقات Django (Microservices)
│   │   │
│   │   ├── 📁 users/                    # [صفحة 12 + صفحة 5 الشخص الأول]
│   │   │   ├── models.py               # User, Role, Permission
│   │   │   ├── serializers.py          # UserSerializer, RoleSerializer
│   │   │   ├── views.py                # UserViewSet, PermissionAPI
│   │   │   ├── permissions.py          # Custom permissions
│   │   │   ├── urls.py
│   │   │   └── tests.py
│   │   │
│   │   ├── 📁 authentication/           # [صفحة 1 + صفحة 2 + صفحة 3]
│   │   │   ├── models.py               # Token, Session
│   │   │   ├── serializers.py          # LoginSerializer, RegisterSerializer
│   │   │   ├── views.py                # LoginAPI, RegisterAPI, PasswordResetAPI
│   │   │   ├── utils.py                # JWT utils, Email sending
│   │   │   ├── urls.py
│   │   │   └── tests.py
│   │   │
│   │   ├── 📁 cameras/                  # [صفحتك 9]
│   │   │   ├── models.py               # Camera, CameraGroup, CameraSettings
│   │   │   ├── serializers.py          # CameraSerializer, GroupSerializer
│   │   │   ├── views.py                # CameraViewSet, CameraHealthAPI
│   │   │   ├── managers.py             # Camera connection manager
│   │   │   ├── urls.py
│   │   │   └── tests.py
│   │   │
│   │   ├── 📁 monitoring/               # [صفحتك 6 - الأصعب]
│   │   │   ├── models.py               # Stream, Layout, Recording
│   │   │   ├── serializers.py          # StreamSerializer, LayoutSerializer
│   │   │   ├── views.py                # StreamAPI, MultiStreamAPI
│   │   │   ├── consumers.py            # WebSocket consumers للبث المباشر
│   │   │   ├── utils.py                # Video processing utilities
│   │   │   ├── urls.py
│   │   │   └── tests.py
│   │   │
│   │   ├── 📁 alerts/                   # [صفحة 8 الشخص الثالث]
│   │   │   ├── models.py               # Alert, AlertType, AlertHistory
│   │   │   ├── serializers.py          # AlertSerializer
│   │   │   ├── views.py                # AlertViewSet, AlertStatsAPI
│   │   │   ├── signals.py              # Signal handlers
│   │   │   ├── urls.py
│   │   │   └── tests.py
│   │   │
│   │   ├── 📁 wanted_persons/           # [صفحة 7 الشخص الثالث]
│   │   │   ├── models.py               # WantedPerson, PersonCategory
│   │   │   ├── serializers.py          # WantedPersonSerializer
│   │   │   ├── views.py                # WantedPersonViewSet
│   │   │   ├── urls.py
│   │   │   └── tests.py
│   │   │
│   │   ├── 📁 dashboard/                # [صفحة 4 الشخص الأول]
│   │   │   ├── models.py               # Dashboard, Widget
│   │   │   ├── serializers.py          # DashboardSerializer
│   │   │   ├── views.py                # DashboardAPI, StatsAPI
│   │   │   ├── urls.py
│   │   │   └── tests.py
│   │   │
│   │   ├── 📁 help/                     # [صفحتك 13]
│   │   │   ├── models.py               # HelpArticle, HelpCategory
│   │   │   ├── serializers.py          # HelpSerializer
│   │   │   ├── views.py                # HelpSearchAPI, HelpContentAPI
│   │   │   ├── urls.py
│   │   │   └── tests.py
│   │   │
│   │   └── 📁 system/                   # [صفحة 11 الشخص الأول]
│   │       ├── models.py               # SystemSettings, Backup, Log
│   │       ├── serializers.py          # SettingsSerializer
│   │       ├── views.py                # SettingsAPI, BackupAPI
│   │       ├── urls.py
│   │       └── tests.py
│   │
│   ├── 📁 media/                        # ملفات الوسائط
│   │   ├── camera_recordings/          # تسجيلات الكاميرات
│   │   ├── person_images/              # صور المطلوبين
│   │   ├── alert_screenshots/          # لقطات التنبيهات
│   │   └── help_assets/                # أصول الصفحات المساعدة
│   │
│   ├── 📁 static/                       # ملفات ثابتة
│   │   ├── css/
│   │   ├── js/
│   │   └── images/
│   │
│   ├── requirements.txt                # متطلبات Python
│   ├── manage.py
│   ├── .env.example                    # مثال ملف البيئة
│   ├── Dockerfile                      # Dockerfile للـ Backend
│   └── README_BACKEND.md               # دليل Backend
│
├── 📁 frontend/                         # [الشخص أ + ب + أنت (صفحاتك)]
│   │
│   ├── 📁 public/                       # ملفات عامة
│   │   ├── index.html
│   │   ├── favicon.ico
│   │   └── robots.txt
│   │
│   ├── 📁 src/                          # مصدر التطبيق
│   │   │
│   │   ├── main.tsx                    # نقطة الدخول
│   │   ├── App.tsx                     # التطبيق الرئيسي
│   │   ├── App.css
│   │   │
│   │   ├── 📁 types/                    # TypeScript Types
│   │   │   ├── camera.ts               # أنواع الكاميرات
│   │   │   ├── user.ts                 # أنواع المستخدمين
│   │   │   ├── alert.ts                # أنواع التنبيهات
│   │   │   ├── video.ts                # أنواع الفيديو
│   │   │   └── index.ts
│   │   │
│   │   ├── 📁 pages/                    # صفحات التطبيق
│   │   │   │
│   │   │   ├── 📁 Login/                # [الشخص أ - صفحة 1]
│   │   │   │   ├── LoginPage.tsx
│   │   │   │   ├── LoginForm.tsx
│   │   │   │   └── styles.module.css
│   │   │   │
│   │   │   ├── 📁 Register/             # [الشخص أ - صفحة 2]
│   │   │   │   ├── RegisterPage.tsx
│   │   │   │   └── RegisterForm.tsx
│   │   │   │
│   │   │   ├── 📁 PasswordReset/        # [أنت - صفحة 3]
│   │   │   │   ├── PasswordResetPage.tsx
│   │   │   │   ├── components/
│   │   │   │   │   ├── ResetRequest.tsx
│   │   │   │   │   ├── ResetForm.tsx
│   │   │   │   │   └── ResetSuccess.tsx
│   │   │   │   ├── hooks/
│   │   │   │   │   └── usePasswordReset.ts
│   │   │   │   └── styles.module.css
│   │   │   │
│   │   │   ├── 📁 Dashboard/            # [الشخص أ - صفحة 4]
│   │   │   │   ├── DashboardPage.tsx
│   │   │   │   ├── components/
│   │   │   │   │   ├── StatsCards.tsx
│   │   │   │   │   ├── ActivityChart.tsx
│   │   │   │   │   └── RecentAlerts.tsx
│   │   │   │   └── styles.module.css
│   │   │   │
│   │   │   ├── 📁 UserManagement/       # [الشخص أ - صفحة 5]
│   │   │   │   ├── UserManagementPage.tsx
│   │   │   │   └── UserTable.tsx
│   │   │   │
│   │   │   ├── 📁 LiveMonitoring/       # [أنت - صفحة 6 - الأصعب]
│   │   │   │   ├── LiveMonitoringPage.tsx
│   │   │   │   ├── components/
│   │   │   │   │   ├── VideoGrid.tsx    # عرض متعدد الكاميرات
│   │   │   │   │   ├── VideoPlayer.tsx  # مشغل فيديو واحد
│   │   │   │   │   ├── ControlPanel.tsx # لوحة التحكم
│   │   │   │   │   ├── LayoutSelector.tsx # اختيار التخطيط
│   │   │   │   │   ├── AlertSidebar.tsx # شريط التنبيهات
│   │   │   │   │   └── CameraOverlay.tsx # تراكبات على الفيديو
│   │   │   │   ├── hooks/
│   │   │   │   │   ├── useVideoStreams.ts
│   │   │   │   │   ├── useWebSocket.ts
│   │   │   │   │   └── useVideoLayout.ts
│   │   │   │   ├── utils/
│   │   │   │   │   ├── videoUtils.ts
│   │   │   │   │   └── layoutUtils.ts
│   │   │   │   ├── 3d/                  # جرافيكس 3D
│   │   │   │   │   ├── BuildingScene.tsx
│   │   │   │   │   ├── Camera3D.tsx
│   │   │   │   │   └── effects/
│   │   │   │   └── styles.module.css
│   │   │   │
│   │   │   ├── 📁 WantedPersons/        # [الشخص ب - صفحة 7]
│   │   │   │   ├── WantedPersonsPage.tsx
│   │   │   │   └── PersonTable.tsx
│   │   │   │
│   │   │   ├── 📁 AlertsLog/            # [الشخص ب - صفحة 8]
│   │   │   │   ├── AlertsLogPage.tsx
│   │   │   │   └── AlertsTable.tsx
│   │   │   │
│   │   │   ├── 📁 CameraManagement/     # [أنت - صفحة 9]
│   │   │   │   ├── CameraManagementPage.tsx
│   │   │   │   ├── components/
│   │   │   │   │   ├── CameraForm.tsx   # نموذج إضافة كاميرا
│   │   │   │   │   ├── CameraTable.tsx  # جدول الكاميرات
│   │   │   │   │   ├── CameraCard.tsx   # بطاقة كاميرا
│   │   │   │   │   ├── SystemHealth.tsx # صحة النظام
│   │   │   │   │   └── CameraGroups.tsx # إدارة المجموعات
│   │   │   │   ├── hooks/
│   │   │   │   │   └── useCameras.ts
│   │   │   │   └── styles.module.css
│   │   │   │
│   │   │   ├── 📁 Reports/              # [الشخص أ - صفحة 10]
│   │   │   │   ├── ReportsPage.tsx
│   │   │   │   └── ReportGenerator.tsx
│   │   │   │
│   │   │   ├── 📁 SystemSettings/       # [الشخص أ - صفحة 11]
│   │   │   │   ├── SystemSettingsPage.tsx
│   │   │   │   └── SettingsForm.tsx
│   │   │   │
│   │   │   ├── 📁 UserPermissions/      # [أنت - صفحة 12]
│   │   │   │   ├── UserPermissionsPage.tsx
│   │   │   │   ├── components/
│   │   │   │   │   ├── RoleManager.tsx  # إدارة الأدوار
│   │   │   │   │   ├── PermissionMatrix.tsx # مصفوفة الصلاحيات
│   │   │   │   │   ├── UserAssignment.tsx # تعيين المستخدمين
│   │   │   │   │   └── PermissionTester.tsx # اختبار الصلاحيات
│   │   │   │   ├── hooks/
│   │   │   │   │   └── usePermissions.ts
│   │   │   │   └── styles.module.css
│   │   │   │
│   │   │   └── 📁 HelpGuide/            # [أنت - صفحة 13]
│   │   │       ├── HelpGuidePage.tsx
│   │   │       ├── components/
│   │   │       │   ├── HelpSearch.tsx   # محرك البحث
│   │   │       │   ├── HelpContent.tsx  # عرض المحتوى
│   │   │       │   ├── HelpCategories.tsx # التصنيفات
│   │   │       │   ├── SupportTicket.tsx # تذاكر الدعم
│   │   │       │   └── InteractiveDemo.tsx # أدوات تفاعلية
│   │   │       ├── hooks/
│   │   │       │   └── useHelp.ts
│   │   │       └── styles.module.css
│   │   │
│   │   ├── 📁 components/               # مكونات مشتركة
│   │   │   ├── 📁 ui/
│   │   │   │   ├── Button.tsx
│   │   │   │   ├── Input.tsx
│   │   │   │   ├── Modal.tsx
│   │   │   │   ├── Table.tsx
│   │   │   │   ├── Card.tsx
│   │   │   │   └── Tabs.tsx
│   │   │   │
│   │   │   ├── 📁 layout/
│   │   │   │   ├── Header.tsx
│   │   │   │   ├── Sidebar.tsx
│   │   │   │   ├── Footer.tsx
│   │   │   │   └── Layout.tsx
│   │   │   │
│   │   │   ├── 📁 charts/
│   │   │   │   ├── LineChart.tsx
│   │   │   │   ├── BarChart.tsx
│   │   │   │   ├── PieChart.tsx
│   │   │   │   └── RealTimeChart.tsx
│   │   │   │
│   │   │   └── 📁 video/
│   │   │       ├── VideoControls.tsx
│   │   │       ├── QualitySelector.tsx
│   │   │       └── VideoOverlay.tsx
│   │   │
│   │   ├── 📁 hooks/                    # Custom Hooks
│   │   │   ├── useAuth.ts
│   │   │   ├── useApi.ts
│   │   │   ├── useWebSocket.ts
│   │   │   ├── useLocalStorage.ts
│   │   │   └── useDebounce.ts
│   │   │
│   │   ├── 📁 services/                 # خدمات APIs
│   │   │   ├── apiClient.ts            # Axios instance
│   │   │   ├── authService.ts          # خدمات المصادقة
│   │   │   ├── cameraService.ts        # خدمات الكاميرات
│   │   │   ├── monitoringService.ts    # خدمات المراقبة
│   │   │   ├── alertService.ts         # خدمات التنبيهات
│   │   │   ├── userService.ts          # خدمات المستخدمين
│   │   │   └── helpService.ts          # خدمات المساعدة
│   │   │
│   │   ├── 📁 store/                    # State Management (Redux)
│   │   │   ├── index.ts
│   │   │   ├── slices/
│   │   │   │   ├── authSlice.ts
│   │   │   │   ├── cameraSlice.ts
│   │   │   │   ├── alertSlice.ts
│   │   │   │   └── uiSlice.ts
│   │   │   └── hooks.ts
│   │   │
│   │   ├── 📁 utils/                    # أدوات مساعدة
│   │   │   ├── formatters.ts           # تنسيق التواريخ والأرقام
│   │   │   ├── validators.ts           # تحقق من المدخلات
│   │   │   ├── videoUtils.ts           # أدوات الفيديو
│   │   │   ├── fileUtils.ts            # معالجة الملفات
│   │   │   └── errorHandler.ts         # معالجة الأخطاء
│   │   │
│   │   ├── 📁 styles/                   # الأنماط
│   │   │   ├── globals.css
│   │   │   ├── variables.css           # CSS Variables
│   │   │   ├── theme.ts                # Theme (لـ Material-UI)
│   │   │   └── animations.css          # Animations
│   │   │
│   │   ├── 📁 assets/                   # الأصول
│   │   │   ├── images/
│   │   │   ├── icons/
│   │   │   └── fonts/
│   │   │
│   │   └── 📁 config/                   # إعدادات Frontend
│   │       ├── routes.ts               # تعريف Routes
│   │       ├── constants.ts            # الثوابت
│   │       └── env.ts                  # متغيرات البيئة
│   │
│   ├── package.json
│   ├── tsconfig.json
│   ├── vite.config.ts                  # Vite config (أسرع من CRA)
│   ├── .env.local
│   ├── Dockerfile                      # Dockerfile للـ Frontend
│   └── README_FRONTEND.md
│
├── 📁 ai_processing/                    # [فريق الذكاء الاصطناعي]
│   │
│   ├── 📁 models/                       # النماذج المدربة
│   │   ├── 📁 detection/
│   │   │   ├── yolov8n.pt             # YOLOv8 nano
│   │   │   ├── yolov8s.pt             # YOLOv8 small
│   │   │   └── yolov8m.pt             # YOLOv8 medium
│   │   │
│   │   ├── 📁 recognition/
│   │   │   ├── insightface/
│   │   │   └── arcface/
│   │   │
│   │   ├── 📁 tracking/
│   │   │   ├── bytetrack/
│   │   │   └── deepsort/
│   │   │
│   │   └── 📁 classification/
│   │       └── efficientnet/
│   │
│   ├── 📁 services/                     # خدمات المعالجة
│   │   ├── video_processor.py          # معالجة الفيديو الرئيسية
│   │   ├── object_detector.py          # كشف الكائنات
│   │   ├── face_recognizer.py          # التعرف على الوجوه
│   │   ├── object_tracker.py           # تتبع الكائنات
│   │   ├── alert_generator.py          # توليد التنبيهات
│   │   └── model_manager.py            # إدارة النماذج
│   │
│   ├── 📁 api/                          # APIs للذكاء الاصطناعي
│   │   ├── main.py                     # FastAPI application
│   │   ├── schemas.py                  # Pydantic schemas
│   │   ├── routes/
│   │   │   ├── detection.py           # route للكشف
│   │   │   ├── recognition.py         # route للتعرف
│   │   │   └── tracking.py            # route للتتبع
│   │   └── middleware/
│   │       └── auth.py                # مصادقة AI APIs
│   │
│   ├── 📁 utils/                        # أدوات AI
│   │   ├── image_utils.py             # معالجة الصور
│   │   ├── video_utils.py             # معالجة الفيديو
│   │   ├── metrics.py                 # مقاييس الأداء
│   │   └── optimizations.py           # تحسينات الأداء
│   │
│   ├── requirements.txt                # متطلبات Python للـ AI
│   ├── Dockerfile                      # Dockerfile للـ AI
│   ├── docker-compose.ai.yml           # تشغيل منفصل للـ AI
│   └── README_AI.md
│
├── 📁 shared/                           # [مشترك بين جميع الفرق]
│   │
│   ├── 📁 types/                        # أنواع TypeScript مشتركة
│   │   ├── camera.types.ts             # Camera, CameraStatus, etc.
│   │   ├── user.types.ts               # User, Role, Permission
│   │   ├── alert.types.ts              # Alert, AlertType
│   │   ├── video.types.ts              # VideoStream, Layout
│   │   └── api.types.ts                # API responses
│   │
│   ├── 📁 schemas/                      # JSON Schemas
│   │   ├── camera.schema.json
│   │   ├── user.schema.json
│   │   └── alert.schema.json
│   │
│   ├── 📁 scripts/                      # سكربتات مشتركة
│   │   ├── setup.sh                    # إعداد البيئة
│   │   ├── deploy.sh                   # سكربت النشر
│   │   ├── backup.sh                   # نسخ احتياطي
│   │   └── migrate.sh                  # ترحيل البيانات
│   │
│   └── 📁 docs/                         # توثيق مشترك
│       ├── api-specification.md        # مواصفات API
│       ├── database-schema.md          # مخطط قاعدة البيانات
│       └── integration-guide.md        # دليل التكامل
│
├── 📁 deployment/                       # [فريق DevOps]
│   │
│   ├── 📁 docker/                       # تكوين Docker
│   │   ├── docker-compose.yml          # للتطوير
│   │   ├── docker-compose.prod.yml     # للإنتاج
│   │   ├── nginx/
│   │   │   ├── nginx.conf              # إعدادات Nginx
│   │   │   ├── ssl/                    # شهادات SSL
│   │   │   └── sites-available/
│   │   │
│   │   └── 📁 monitoring/               # مراقبة النظام
│   │       ├── prometheus.yml
│   │       ├── grafana/
│   │       └── alerts/
│   │
│   ├── 📁 kubernetes/                   # تكوين Kubernetes
│   │   ├── namespaces/
│   │   ├── deployments/
│   │   ├── services/
│   │   ├── configmaps/
│   │   └── secrets/
│   │
│   └── 📁 terraform/                    # Infrastructure as Code
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── 📁 docs/                             # توثيق المشروع
│   │
│   ├── 📁 technical/                    # توثيق تقني
│   │   ├── architecture.md             # بنية النظام
│   │   ├── api-documentation.md       # توثيق APIs
│   │   ├── database-design.md         # تصميم قاعدة البيانات
│   │   └── deployment.md              # دليل النشر
│   │
│   ├── 📁 user/                         # دليل المستخدم
│   │   ├── getting-started.md         # البدء السريع
│   │   ├── user-guide.md              # دليل المستخدم
│   │   ├── admin-guide.md             # دليل المدير
│   │   └── faq.md                     # الأسئلة الشائعة
│   │
│   ├── 📁 development/                  # دليل المطور
│   │   ├── setup-guide.md             # دليل الإعداد
│   │   ├── coding-standards.md        # معايير الكود
│   │   ├── testing-guide.md           # دليل الاختبار
│   │   └── contribution-guide.md      # دليل المساهمة
│   │
│   └── project-specifications.md       # مواصفات المشروع الكاملة
│
├── docker-compose.yml                   # ملف Docker Compose الرئيسي
├── docker-compose.override.yml          # إعدادات التطوير
├── .gitignore
├── .env.example                        # مثال لملف البيئة
├── Makefile                            # أوامر سريعة
├── LICENSE
└── README.md                           # دليل المشروع الرئيسي
text

## 🚀 البدء السريع

### المتطلبات
- Docker و Docker Compose
- Git

### خطوات التشغيل
1. نسخ المشروع:
```bash
git clone https://github.com/Anas-galal-1985/smart-surveillance-system.git
cd smart-surveillance-system
تشغيل جميع الخدمات:

bash
make up
فتح المتصفح:

لوحة التحكم: http://localhost:8501

واجهة APIs: http://localhost:8000

👥 فريق التطوير
الشخص ج: Django Backend

الشخص د: Streamlit Pages 1-5

الشخص هـ: Streamlit Pages 6-13

فريق الذكاء الاصطناعي: نماذج المعالجة

📄 الرخصة
هذا المشروع مرخص تحت رخصة MIT.
