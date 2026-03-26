BEGIN;

-- Categories
INSERT INTO foods_foodcategory (id, created, modified, name_ru, name_en, name_ch, order_id)
VALUES
  (1, NOW(), NOW(), 'Напитки', NULL, NULL, 10),
  (2, NOW(), NOW(), 'Выпечка', NULL, NULL, 20)
ON CONFLICT (id) DO NOTHING;

-- Foods
INSERT INTO foods_food (id, created, modified, category_id, is_vegan, is_special, code, internal_code, name_ru,
                        description_ru, description_en, description_ch, cost, is_publish)
VALUES
  (1, NOW(), NOW(), 1, FALSE, FALSE, 1, 100, 'Чай', 'Чай 100 гр', NULL, NULL, 123.00, TRUE),
  (2, NOW(), NOW(), 1, FALSE, FALSE, 2, 200, 'Кола', 'Кола', NULL, NULL, 123.00, TRUE),
  (3, NOW(), NOW(), 1, FALSE, FALSE, 3, 300, 'Спрайт', 'Спрайт', NULL, NULL, 123.00, TRUE),
  (4, NOW(), NOW(), 1, FALSE, FALSE, 4, 400, 'Байкал', 'Байкал', NULL, NULL, 123.00, TRUE),
  (5, NOW(), NOW(), 2, FALSE, FALSE, 5, 500, 'Булочка', 'Булочка', NULL, NULL, 99.00, FALSE),
  (6, NOW(), NOW(), 2, FALSE, FALSE, 6, 600, 'Пирожок', 'Пирожок', NULL, NULL, 99.00, TRUE)
ON CONFLICT (id) DO NOTHING;

COMMIT;
