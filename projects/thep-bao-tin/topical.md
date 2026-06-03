# Topical Map — Thép Bảo Tín

> Sơ đồ topical map của Thép Bảo Tín — nhà phân phối ống thép & vật tư M&E.
> AI PHẢI đọc file này TRƯỚC khi viết bài để hiểu cluster hierarchy + Topical Context Linking.
> Kết hợp với `keywords-urls.md` để biết URL sẵn có cho internal link.

## Cấu trúc Topical Map

> **Quy ước ký hiệu:**
> - 🏛️ = **Pillar** (trang danh mục / bài tổng quan bao quát — DEEP toàn diện cluster)
> - 📦 = **Cluster** (nhóm chủ đề chính)
> - 📄 = **Supporting** (bài hỗ trợ chi tiết — narrower topic, song song với pillar)
> - 🧬 = **Variant** (bài sản phẩm theo size/SKU/model — SHORT general + DEEP differentiator)
> - 🔗 = **Sub-cluster** (nhóm con trong cluster)

## Article Roles v1.1 (2026-05-27)

> **Định nghĩa role để skill content gate độ sâu khi viết.**

| Role | Ký hiệu | Mục đích | Content depth | Parent_url | Differentiator |
|------|---------|---------|---------------|------------|----------------|
| pillar | 🏛️ | Hub bao quát cluster | DEEP toàn cluster (định nghĩa, quy trình, tiêu chuẩn chung, ứng dụng general) | — | — |
| supporting | 📄 | Narrower topic trong cluster (vd "Phân biệt ống đúc/hàn", "Quy trình sản xuất") | DEEP về topic riêng, KHÔNG lặp pillar | pillar_slug | topic_name |
| **variant** | 🧬 | **Sản phẩm theo size/SKU** (vd "ống đúc phi 76") | **SHORT general (≤120 từ + link pillar) + DEEP differentiator (400-600 từ)** | pillar_slug | size, SKU, model |

### Variant content gating (BẮT BUỘC khi role=variant)

| Section | Pillar (cũ) | Variant (mới) |
|---|---|---|
| Định nghĩa chung "X là gì" | 500-800 từ deep | **≤120 từ tóm tắt + link đến pillar** |
| Quy trình sản xuất | 400-600 từ | **≤80 từ + link** |
| Tiêu chuẩn chung (ASTM/JIS/TCVN) | 600 từ | **≤100 từ + link** |
| **Thông số kỹ thuật của size cụ thể** | (không có) | **400-600 từ DEEP** (DN, OD, wall thickness, weight/m, áp lực) |
| **Ứng dụng SPECIFIC cho size** | (general) | **400-600 từ DEEP — công trình/ngành nào ưu tiên size này** |
| Bảng so sánh size khác trong cluster | optional | **bắt buộc** |
| Giá / availability của size | optional | **bắt buộc** |

→ Variant ưu tiên **60-70% từ ngữ vào differentiator-specific content**, 30-40% còn lại reference pillar.

### Demo: Variant rows trong cluster "Ống Thép Đúc"

| Slug | Vai trò | Parent URL | Differentiator | Ứng dụng SPECIFIC (DEEP focus) |
|------|---------|-----------|----------------|--------------------------------|
| ong-thep-duc | 🏛️ pillar | — | — | Toàn ngành |
| ong-thep-duc-phi-21 | 🧬 variant | ong-thep-duc | size=DN15 (Φ21mm), wall 2.0-3.7mm | Ống nước nóng/lạnh dân dụng, gas thấp áp |
| ong-thep-duc-phi-27 | 🧬 variant | ong-thep-duc | size=DN20 (Φ27mm) | Hệ thống PCCC mini, ống dẫn khí |
| ong-thep-duc-phi-34 | 🧬 variant | ong-thep-duc | size=DN25 (Φ34mm) | PCCC trung bình, đường ống công nghiệp nhẹ |
| ong-thep-duc-phi-42 | 🧬 variant | ong-thep-duc | size=DN32 (Φ42mm) | Ống dẫn dầu, hệ thống HVAC |
| ong-thep-duc-phi-48 | 🧬 variant | ong-thep-duc | size=DN40 (Φ48mm) | Khung kết cấu, giàn giáo |
| ong-thep-duc-phi-60 | 🧬 variant | ong-thep-duc | size=DN50 (Φ60mm) | PCCC chính, đường ống nhiệt |
| ong-thep-duc-phi-76 | 🧬 variant | ong-thep-duc | **size=DN65 (Φ76mm), wall 3.2-6.0mm, weight 5.7-10.4kg/m** | **PCCC công nghiệp, đường ống dẫn dầu khí cao áp, hệ thống làm mát nhà máy** |
| ong-thep-duc-phi-90 | 🧬 variant | ong-thep-duc | **size=DN80 (Φ90mm), wall 4.0-6.0mm, weight 8.5-12.5kg/m** | **Đường ống nước thải công nghiệp, PCCC cao tầng, hệ thống dẫn hơi nóng** |
| ong-thep-duc-phi-114 | 🧬 variant | ong-thep-duc | size=DN100 (Φ114mm) | Đường ống chính khu công nghiệp, dẫn khí, gas trung áp |
| ong-thep-duc-phi-127 | 🧬 variant | ong-thep-duc | size=DN125 (Φ127mm) | Ống dẫn nước thô nhà máy nước, slurry mỏ |
| ong-thep-duc-phi-141 | 🧬 variant | ong-thep-duc | size=DN125 (Φ141mm) | Đường ống dẫn nước, hệ thống thoát |
| ong-thep-duc-phi-168 | 🧬 variant | ong-thep-duc | **size=DN150 (Φ168mm), wall 5.0-8.0mm, weight 20.1-31.6kg/m** | **Đường ống dẫn dầu khí trung áp, cấp nước đô thị, hệ thống làm mát quy mô lớn nhà máy điện** |
| ong-thep-duc-phi-219 | 🧬 variant | ong-thep-duc | size=DN200 (Φ219mm) | Đường ống dẫn dầu thô, cấp nước city scale, slurry mỏ quặng |
| ong-thep-duc-phi-273 | 🧬 variant | ong-thep-duc | size=DN250 (Φ273mm) | Pipeline dẫn dầu cao áp, hệ thống xử lý nước thải KCN |
| ong-thep-duc-phi-325 | 🧬 variant | ong-thep-duc | size=DN300 (Φ325mm) | Ống truyền tải dầu khí, đường ống cấp nước thô |
| ong-thep-duc-phi-355 | 🧬 variant | ong-thep-duc | size=DN350 (Φ355mm) | Pipeline cao áp, đường ống nước thô đô thị |
| ong-thep-duc-phi-406 | 🧬 variant | ong-thep-duc | size=DN400 (Φ406mm) | Đường ống truyền tải dầu khí liên tỉnh, ống cấp nước city scale |
| ong-thep-duc-phi-508 | 🧬 variant | ong-thep-duc | size=DN500 (Φ508mm) | Pipeline trục dầu khí, đường ống nước thô liên vùng |
| ong-thep-duc-phi-610 | 🧬 variant | ong-thep-duc | size=DN600 (Φ610mm) | Pipeline truyền tải dầu khí lớn, ống cấp nước hệ thống quốc gia |

> **Lưu ý**: Bảng trên là **demo cluster Ống thép đúc** để skill content tham chiếu khi viết. Các cluster khác (Ống mạ kẽm theo phi, Ống đen theo phi, Thép hình theo size, Thép hộp theo cạnh...) áp dụng cùng pattern variant role.

### Cluster khác có variant pattern tương tự

- **Ống thép mạ kẽm theo phi**: variant rows {phi 60, 76, 90, 114, 140, D200} → parent: `ong-thep-ma-kem`
- **Thép hình theo profile**: variant rows {I, U, V, H, L} → parent: `thep-hinh`
- **Thép hộp theo cạnh**: variant rows {cạnh 50, 75, 100, 150, 200} → parent: `thep-hop`
- **Ống thép hàn theo DN**: variant rows {DN300, 350, 400, 450, 500, 550, 600, 700, 800} → parent: `ong-thep-han`

→ AI khi viết bài variant trong các cluster này BẮT BUỘC áp dụng **content gating table** ở trên.

```
THÉP BẢO TÍN — NHÀ PHÂN PHỐI ỐNG THÉP & VẬT TƯ M&E
│
├── 📦 Kiến Thức Thép Tổng Hợp (Nền tảng)
│   ├── 📄 Thép là gì? Phân loại thép trong xây dựng
│   ├── 📄 Phân biệt sắt và thép
│   ├── 📄 HRC là gì
│   ├── 📄 Thép Mangan
│   ├── 📄 Kim loại
│   ├── 📄 Quặng sắt
│   ├── 📄 Bảng tra mác thép xây dựng
│   ├── 📄 Thép có bị gỉ không
│   ├── 📄 Tiêu chuẩn thép xây dựng
│   ├── 📄 Quy trình sản xuất thép
│   ├── 📄 Thị trường thép Việt Nam
│   ├── 📄 Nguyên liệu sản xuất gang
│   ├── 📄 Thép SKD61 / SKD11 / S45C
│   ├── 📄 Gia công kết cấu thép
│   ├── 📄 Trọng lượng riêng của thép
│   ├── 📄 Giới hạn bền của thép
│   ├── 📄 Thép gió là gì
│   ├── 📄 Chứng nhận xuất xưởng / Mill Test
│   ├── 📄 Thép Hardox / Thép Corten
│   ├── 📄 Cách đọc ký hiệu thép
│   ├── 📄 Xử lý nhiệt kim loại
│   ├── 📄 Thép cường độ cao
│   ├── 📄 Tái chế thép
│   ├── 📄 Giá thép xây dựng hôm nay
│   ├── 📄 Cửa hàng sắt thép gần đây
│   └── 📄 Top công ty thép uy tín Việt Nam
│
├── 📦 Ống Thép (Core Cluster)
│   │
│   ├── 🔗 Ống Thép Đúc
│   │   ├── 🏛️ Ống thép đúc (trang danh mục sản phẩm)
│   │   ├── 📄 Tiêu chuẩn ống thép đúc (DIN, ASTM A53, A106, API 5L, SCH40, SCH80, GB/T 700)
│   │   ├── 📄 Ống thép đúc theo phi: 21, 27, 34, 42, 48, 60, 76, 90, 114, 127, 141, 168, 219, 273, 325, 355, 406, 508, 610
│   │   ├── 📄 Giá ống thép đúc Trung Quốc
│   │   ├── 📄 Ống thép đúc nhập khẩu
│   │   ├── 📄 Ống thép đúc Hòa Phát
│   │   ├── 📄 Phụ kiện ống thép đúc
│   │   ├── 📄 Phân biệt ống đúc và ống hàn
│   │   ├── 📄 Ống thép carbon
│   │   ├── 📄 Cách bảo quản ống thép đúc
│   │   ├── 📄 Quy trình sản xuất ống đúc và ống hàn
│   │   └── 📄 Mua ống thép đúc tại Hà Nội
│   │
│   ├── 🔗 Ống Thép Mạ Kẽm
│   │   ├── 🏛️ Ống thép mạ kẽm (trang danh mục sản phẩm)
│   │   ├── 📄 Giá thép ống mạ kẽm / Bảng giá
│   │   ├── 📄 Thép mạ kẽm (tổng quan)
│   │   ├── 📄 Mạ kẽm nhúng nóng
│   │   ├── 📄 Quy cách ống thép mạ kẽm
│   │   ├── 📄 Ký hiệu ống thép mạ kẽm
│   │   ├── 📄 Sơn ống thép mạ kẽm
│   │   ├── 📄 Ống hàn mạ kẽm
│   │   ├── 📄 Ống mạ kẽm cỡ lớn
│   │   ├── 📄 Ống nước mạ kẽm (thay ống nhựa bằng thép mạ kẽm)
│   │   ├── 📄 Tôn kẽm là gì / Tôn mạ kẽm dạng cuộn
│   │   ├── 📄 Công ty sản xuất ống thép mạ kẽm
│   │   ├── 🔗 Theo thương hiệu
│   │   │   ├── 📄 Ống thép mạ kẽm Hòa Phát (giá, trọng lượng, tiêu chuẩn, catalogue, nhúng nóng)
│   │   │   ├── 📄 Ống thép mạ kẽm Hoa Sen (giá, nhúng nóng)
│   │   │   ├── 📄 Ống thép mạ kẽm Việt Đức (giá, bảng giá)
│   │   │   ├── 📄 Ống thép mạ kẽm Vinapipe (giá)
│   │   │   └── 📄 Ống thép mạ kẽm SeAH
│   │   └── 🔗 Theo kích thước
│   │       ├── 📄 Ống mạ kẽm phi 60 (giá, Hoa Sen)
│   │       ├── 📄 Ống mạ kẽm phi 76
│   │       ├── 📄 Ống mạ kẽm phi 90
│   │       ├── 📄 Ống mạ kẽm phi 114
│   │       ├── 📄 Ống mạ kẽm phi 140
│   │       └── 📄 Ống mạ kẽm D200
│   │
│   ├── 🔗 Ống Thép Đen
│   │   ├── 🏛️ Ống thép đen (trang danh mục sản phẩm)
│   │   ├── 📄 Giá thép ống đen / Bảng giá
│   │   ├── 📄 Tiêu chuẩn ống thép đen
│   │   ├── 📄 Barem ống thép đen
│   │   ├── 📄 Quy trình sơn ống thép đen
│   │   ├── 📄 Ống thép đen D300
│   │   ├── 📄 Ống thép đen cỡ lớn
│   │   ├── 🔗 Theo thương hiệu
│   │   │   ├── 📄 Ống thép đen Hòa Phát (tiêu chuẩn, catalogue, trọng lượng)
│   │   │   ├── 📄 Ống thép đen Vinapipe
│   │   │   ├── 📄 Ống thép đen Việt Đức
│   │   │   ├── 📄 Ống thép đen SeAH
│   │   │   └── 📄 Ống thép đen Hoa Sen
│   │
│   ├── 🔗 Ống Thép Cỡ Lớn
│   │   ├── 🏛️ Ống thép cỡ lớn (trang danh mục sản phẩm)
│   │   ├── 📄 Bảng giá ống thép cỡ lớn
│   │   ├── 📄 Ống thép hàn cỡ lớn
│   │   ├── 📄 Phụ kiện ống thép cỡ lớn
│   │   └── 📄 Ống thép cỡ lớn DN750 / D168
│   │
│   ├── 🔗 Ống Thép Hàn
│   │   ├── 🏛️ Ống thép hàn (tổng quan tiêu chuẩn quy cách)
│   │   ├── 📄 Phụ kiện ống thép hàn
│   │   ├── 📄 Ống thép hàn xoắn SSAW
│   │   ├── 📄 Kỹ thuật hàn ống thép
│   │   ├── 📄 Ống thép ERW là gì
│   │   └── 📄 Ống thép hàn theo DN: 300, 350, 400, 450, 500, 550, 600, 700, 800, phi 273
│   │
│   ├── 📄 Giá thép ống (trang chung)
│   ├── 📄 Ký hiệu đường kính ống thép
│   ├── 📄 Bảng tra trọng lượng thép ống tròn
│   ├── 📄 Hàng rào ống thép tròn
│   ├── 📄 Chọn mua các loại ống thép tròn
│   └── 📄 Ống thép Hòa Phát (trang thương hiệu chung)
│
├── 📦 Thép Hình
│   ├── 🏛️ Thép hình (trang danh mục sản phẩm)
│   ├── 📄 Thép hình I (giá, trọng lượng, bảng quy cách)
│   ├── 📄 Thép hình U (giá)
│   ├── 📄 Thép hình V (giá, bảng tra khối lượng)
│   ├── 📄 Thép hình H (giá)
│   ├── 📄 Phân biệt thép H và thép I
│   ├── 📄 Bảng tra thép hình / thép hình L
│   ├── 📄 Tiêu chuẩn nghiệm thu vật liệu thép hình
│   ├── 📄 Thép hình An Khánh
│   ├── 📄 Thép hình C300
│   ├── 📄 Xà gồ là gì / Xà gồ C / Xà gồ Z
│   ├── 📄 Bảng giá xà gồ thép mạ kẽm Hoa Sen
│   └── 📄 Xà gồ hộp 5x10
│
├── 📦 Thép Hộp
│   ├── 🏛️ Thép hộp (trang danh mục sản phẩm + giá)
│   ├── 📄 Trọng lượng thép hộp / Bảng tra
│   ├── 📄 Bảng tra sức chịu tải của thép hộp
│   ├── 📄 Cách tính trọng lượng thép hộp
│   ├── 📄 Cây thép hộp dài bao nhiêu
│   ├── 📄 Vì kèo thép hộp
│   ├── 📄 Lan can cầu thang thép hộp
│   ├── 📄 Hàng rào thép hộp
│   ├── 📄 Khoảng cách xà gồ thép hộp lợp tôn
│   ├── 📄 Báo giá sơn tĩnh điện thép hộp
│   ├── 📄 Đơn giá gia công thép hộp
│   ├── 📄 Thép hộp tam giác
│   ├── 🔗 Thép hộp vuông (theo kích thước)
│   │   ├── 📄 10x10, 14x14, 16x16, 20x20, 25x25, 30x30, 40x40, 50x50
│   │   ├── 📄 60x60, 75x75, 80x80, 100x100, 120x120, 150x150, 200x200
│   │   └── 📄 Thép hộp vuông (trang tag tổng hợp)
│   ├── 🔗 Thép hộp chữ nhật (theo kích thước)
│   │   ├── 📄 10x20, 13x26, 20x40, 25x50, 30x60, 40x60, 40x80
│   │   ├── 📄 50x70, 50x100, 60x80, 60x120, 100x200
│   │   └── 📄 Thép hộp chữ nhật (trang tag tổng hợp)
│   ├── 🔗 Theo thương hiệu
│   │   ├── 📄 Thép hộp Hòa Phát (giá, đen, mạ kẽm, kích thước, chứng chỉ)
│   │   ├── 📄 Thép hộp Hoa Sen (giá, trọng lượng, quy cách mạ kẽm)
│   │   ├── 📄 Thép hộp Nam Kim
│   │   ├── 📄 Thép hộp Đông Á
│   │   ├── 📄 Thép hộp Vinaone
│   │   ├── 📄 Thép hộp Vinapipe (mạ kẽm)
│   │   └── 📄 Thép hộp Việt Đức (mạ kẽm)
│   └── 📄 Thép hộp inox / Inox 304 (trọng lượng, giá)
│
├── 📦 Thép Tấm
│   ├── 🏛️ Thép tấm (trang danh mục sản phẩm)
│   ├── 📄 Cách tính trọng lượng thép tấm
│   ├── 📄 Tính khối lượng thép (công thức chung)
│   ├── 📄 Tiêu chuẩn thép tấm
│   ├── 📄 Gia công thép tấm (quy trình)
│   ├── 📄 Thép SS400 / Thép Q235 / Thép tấm CT3
│   ├── 📄 Thép cán nóng và cán nguội (phân biệt)
│   ├── 📄 Thép tấm cán nóng / Thép tấm cán nguội
│   ├── 📄 Thép tấm gân (chống trượt)
│   ├── 📄 Thép tấm mạ kẽm
│   ├── 📄 Tấm thép đục lỗ
│   ├── 📄 Thép mỏng (miếng thép mỏng)
│   ├── 📄 Thép cường độ cao
│   ├── 📄 Giá thép tấm đóng tàu
│   ├── 📄 Giá thép tấm Trung Quốc
│   ├── 🔗 Theo độ dày
│   │   ├── 📄 Thép tấm 1 ly / 1.5 ly
│   │   ├── 📄 Giá thép tấm 2 ly
│   │   ├── 📄 Thép tấm 3 ly (3mm)
│   │   ├── 📄 Thép tấm 5 ly
│   │   ├── 📄 Giá thép tấm 6 ly
│   │   └── 📄 Thép tấm 8 ly
│   ├── 🔗 Theo thương hiệu tôn
│   │   ├── 📄 Tôn Hoa Sen (giá, catalogue, mạ kẽm)
│   │   ├── 📄 Tôn Hòa Phát (đại lý, thép tấm Hòa Phát)
│   │   ├── 📄 Tôn Nam Kim (giá, tôn lạnh, tôn mạ kẽm)
│   │   └── 📄 Tôn Đông Á
│   ├── 📄 Tôn phẳng / Tôn sóng / Tôn lợp mái / Tôn sắt (so sánh tôn và thép)
│   ├── 📄 Tole là gì
│   ├── 📄 Sắt la (quy cách)
│   ├── 📄 Thanh la inox
│   ├── 📄 Bản mã thép / Gia công bản mã
│   └── 📄 Bu lông là gì
│
├── 📦 Thép Xây Dựng Đặc Biệt
│   ├── 📄 Thép tròn trơn
│   ├── 📄 Thép vuông đặc
│   ├── 📄 Thép thanh vằn
│   ├── 📄 Thép không gỉ
│   ├── 📄 Thép cacbon
│   └── 📄 Thép cuộn (thép dây cuộn xây dựng)
│
├── 📦 Phụ Kiện Đường Ống
│   │
│   ├── 🔗 Mặt Bích
│   │   ├── 🏛️ Mặt bích (trang danh mục sản phẩm)
│   │   ├── 📄 Mặt bích thép / Các loại mặt bích
│   │   ├── 📄 Tiêu chuẩn mặt bích (JIS, DIN, ANSI, BS)
│   │   ├── 📄 Giá mặt bích / Bảng giá
│   │   ├── 📄 Cách hàn mặt bích / Cách lắp mặt bích
│   │   ├── 📄 Công thức tính khối lượng mặt bích tròn / Chia lỗ trên mặt bích
│   │   ├── 📄 Vật liệu chế tạo mặt bích
│   │   ├── 📄 Phụ kiện mặt bích
│   │   ├── 📄 Nguyên nhân rò rỉ mặt bích / Bu lông mặt bích
│   │   ├── 🔗 Theo kiểu kết nối
│   │   │   ├── 📄 Mặt bích cổ hàn / Hàn trượt / Hàn bọc đúc
│   │   │   ├── 📄 Mặt bích ren
│   │   │   ├── 📄 Mặt bích mù (+ JIS 10K)
│   │   │   ├── 📄 Mặt bích lỏng (Lap Joint)
│   │   │   ├── 📄 Mặt bích vuông
│   │   │   └── 📄 Mặt bích RF và FF (so sánh)
│   │   ├── 🔗 Theo tiêu chuẩn
│   │   │   ├── 📄 Mặt bích JIS 10K / JIS 5K
│   │   │   ├── 📄 Mặt bích DIN PN16
│   │   │   ├── 📄 Mặt bích BS4504 PN16
│   │   │   └── 📄 Mặt bích Class 150
│   │   ├── 🔗 Theo chất liệu
│   │   │   ├── 📄 Mặt bích inox 304 / 316 / Inox JIS 10K
│   │   │   ├── 📄 Mặt bích gang
│   │   │   ├── 📄 Mặt bích đồng / Nhôm
│   │   │   ├── 📄 Mặt bích nhựa / HDPE
│   │   │   └── 📄 Mặt bích thép mạ kẽm
│   │   ├── 🔗 Theo kích thước
│   │   │   ├── 📄 Mặt bích DN50 / DN80
│   │   │   └── 📄 Mặt bích ống gió / Mặt bích máy bơm
│   │   ├── 📄 Gioăng mặt bích
│   │   ├── 📄 Khớp nối mặt bích
│   │   ├── 📄 So sánh mặt bích inox 201 và 304
│   │   └── 📄 Van bi mặt bích / Van bướm mặt bích / Van mặt bích (bảng giá)
│   │
│   ├── 🔗 Van Công Nghiệp
│   │   ├── 📄 Van cửa đồng
│   │   ├── 📄 Van bướm tay quay
│   │   ├── 📄 Van giảm áp hơi gang nối bích
│   │   ├── 📄 Van một chiều hơi mặt bích / Van một chiều lá lật inox mặt bích
│   │   ├── 📄 Van cầu inox lắp bích
│   │   └── 📄 Bẫy hơi phao mặt bích Nicoson Taiwan
│   │
│   ├── 🔗 Phụ Kiện Ống Thép (ren, hàn, kẽm)
│   │   ├── 🏛️ Phụ kiện ống thép (trang danh mục sản phẩm)
│   │   ├── 📄 Khớp nối ống thép
│   │   ├── 📄 Coupler nối thép
│   │   ├── 📄 Cút thép hàn
│   │   ├── 📄 Phụ kiện ống thép tráng kẽm Hòa Phát
│   │   ├── 📄 Phụ kiện ren inox 201 / Phụ kiện ren
│   │   ├── 📄 Ống thép bọc nhựa PE
│   │   ├── 📄 Catalogue phụ kiện: FKK, Siam, Shanxi Bot, Mech, ống thép Hòa Phát
│   │   └── 📄 Bảng giá phụ kiện: hàn FKK, ren Siam
│   │
│   └── 📄 Cóc nối thép
│
├── 📦 Vật Tư PCCC
│   ├── 🏛️ Thiết bị PCCC (trang danh mục)
│   ├── 📄 Phòng chống cháy nổ / Biện pháp phòng chống cháy nổ
│   ├── 📄 Quy định về lắp đặt hệ thống PCCC
│   ├── 📄 Cách dùng bình chữa cháy
│   ├── 🔗 Thiết bị báo cháy
│   │   ├── 🏛️ Hệ thống báo cháy (trang danh mục)
│   │   └── 📄 Các loại hệ thống báo cháy
│   ├── 🔗 Thiết bị & hệ thống chữa cháy
│   │   ├── 🏛️ Hệ thống chữa cháy (trang danh mục)
│   │   └── 🏛️ Thiết bị chữa cháy (trang danh mục)
│   └── 📄 Thi công đường ống (lựa chọn thép cho ống thoát nước)
│
├── 📦 Inox (cluster phụ)
│   └── (Chưa có nhiều bài — xem topical map gốc để mở rộng)
│
└── 📦 Thương Hiệu Đối Tác
    ├── 📄 Đại lý thép Hòa Phát chính hãng
    ├── 📄 Chứng chỉ xuất xưởng thép Hòa Phát
    └── 📄 Catalogue Hoa Sen (ống thép mạ kẽm)
```

## Category Hierarchy (cho Topical Context Linking)

Khi viết bài, sử dụng hierarchy dưới đây để xác định context linking:

| Cấp | Nội dung | Ví dụ |
|-----|----------|-------|
| **Cha (Ngành)** | Ngành vật liệu xây dựng / Thép công nghiệp | Thép Bảo Tín — nhà phân phối |
| **Con (Cluster)** | Ống Thép / Thép Hình / Thép Hộp / Thép Tấm / Phụ Kiện / PCCC | Ống Thép Đúc |
| **Cháu (Sub-cluster)** | Theo phi, theo thương hiệu, theo tiêu chuẩn | Ống đúc phi 219, Ống đúc Hòa Phát |

**Ví dụ Topical Context Linking khi viết "Ống thép đúc phi 219":**
- Link cha: Ống thép đúc (pillar cluster)
- Link ngang: Ống đúc phi 168, phi 273 (cùng sub-cluster kích thước)
- Link liên quan: Tiêu chuẩn ASTM A106, Phụ kiện ống thép đúc
- Context đoạn mở: "Trong hệ thống ống thép công nghiệp, ống đúc phi 219 (DN200) thuộc nhóm kích thước phổ biến cho..."

## Hướng dẫn sử dụng

1. **Xác định cluster**: Bài viết thuộc cluster nào? (Ống Thép / Thép Hình / Thép Hộp / Thép Tấm / Phụ Kiện / PCCC)
2. **Xác định role**: Pillar (🏛️ trang danh mục) / Supporting (📄 bài chi tiết) / **Variant (🧬 sản phẩm theo size/SKU)**?
   - Nếu **variant** → áp dụng **Variant content gating table** (≤120 từ general + 400-600 từ differentiator) + reference parent pillar
3. **Xác định sub-cluster**: Theo phi, theo thương hiệu, theo tiêu chuẩn, theo ứng dụng?
4. **Context Linking**: Dùng bảng Category Hierarchy → link cha/con/ngang
5. **Internal Links**: Đọc `keywords-urls.md` → lọc bài cùng cluster + bài liên quan
6. **External Citation v1.3** (nếu cite chuẩn ASTM/JIS/TCVN/ISO): đọc `external-sources.md` → tuân thủ per-citation workflow (web search `site:{domain} "{topic}"`, TUYỆT ĐỐI không paste sample_urls)
