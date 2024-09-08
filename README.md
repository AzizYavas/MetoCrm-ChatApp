# MetoCrm - ChatApp

Bu proje, Laravel 11, Livewire ve Laravel Reverb kullanılarak geliştirilmiştir. Aşağıdaki adımları takip ederek projeyi kurabilir ve çalıştırabilirsiniz.

##Tüm Sistemde Kayıtlı Olan Kullanıcı ve Adminler şifresi : 12345678

## Gereksinimler

- PHP 8.x veya daha üstü
- Composer
- Node.js (npm)
- Laravel 11.x
- Livewire
- Laravel Reverb

## Kurulum

1. Projeyi klonlayın:
    ```bash
    git clone https://github.com/kullanici-adi/proje-adi.git
    ```

2. Proje dizinine gidin:
    ```bash
    cd proje-adi
    ```

3. PHP ve JavaScript bağımlılıklarını yükleyin:
    ```bash
    composer install
    npm install
    ```

4. Ortam değişkenlerini ayarlayın:
    ```bash
    cp .env.example .env
    php artisan key:generate
    ```

5. Veritabanı yapılandırmanızı `.env` dosyasında yapın ve ardından migrate komutunu çalıştırın:
    ```bash
    php artisan migrate
    ```

## Projeyi Çalıştırma

Projeyi çalıştırmak için aşağıdaki adımları izleyin:

1. Laravel uygulamasını başlatın:
    ```bash
    php artisan serve
    ```

2. Livewire ve diğer frontend derlemelerini başlatın:
    ```bash
    npm run dev
    ```

3. Laravel Reverb Queue dinleyicisini çalıştırın:
    ```bash
    php artisan reverb:start
    ```

## Katkıda Bulunma

Projeye katkıda bulunmak isterseniz, lütfen bir pull request gönderin veya bir issue açın.

## Lisans

Bu proje MIT lisansı ile lisanslanmıştır.
