# Topical Map — {Tên Dự Án}

> File này chứa sơ đồ topical map của dự án. Mỗi dự án có 1 topical map riêng.
> Khi viết nội dung, AI PHẢI đọc file này TRƯỚC để hiểu:
> 1. Bài viết thuộc cluster/sub-cluster nào
> 2. Category hierarchy (cha → con → cháu) để Topical Context Linking
> 3. Bài nào là pillar, bài nào là supporting/sub-cluster
> 4. Liên kết nào cần chèn (xem thêm `keywords-urls.md`)

## Cấu trúc Topical Map

> **Quy ước ký hiệu:**
> - 🏛️ = **Pillar** (bài trung tâm, bao quát toàn bộ chủ đề)
> - 📦 = **Cluster** (nhóm chủ đề con)
> - 📄 = **Supporting** (bài hỗ trợ, chi tiết)
> - 🔗 = **Sub-cluster** (nhóm con trong cluster)

```
{TÊN DỰ ÁN} - TOPICAL MAP
│
├── 📦 {Cluster 1: Tên cluster}
│   ├── 🏛️ {Pillar: Tên bài pillar}
│   ├── 📄 {Supporting 1}
│   ├── 📄 {Supporting 2}
│   └── 🔗 {Sub-cluster}
│       ├── 📄 {Supporting 3}
│       └── 📄 {Supporting 4}
│
├── 📦 {Cluster 2: Tên cluster}
│   ├── 🏛️ {Pillar: Tên bài pillar}
│   ├── 📄 {Supporting 1}
│   └── 📄 {Supporting 2}
│
└── 📦 {Cluster N: Tên cluster}
    ├── 🏛️ {Pillar}
    └── 📄 {Supporting}
```

## Chi tiết từng Cluster

### 📦 Cluster 1: {Tên cluster}

**Category hierarchy**: {Ngành lớn} → {Lĩnh vực} → {Chủ đề cụ thể}

| # | Keyword | Loại | Vai trò | Search Intent | Ghi chú |
|---|---------|------|---------|---------------|---------|
| 1 | {keyword} | {head/long-tail} | pillar | I/N/C/T | |
| 2 | {keyword} | {head/long-tail} | supporting | I/N/C/T | |
| 3 | {keyword} | {head/long-tail} | supporting | I/N/C/T | |

**Internal link plan:**
- Pillar ← tất cả supporting trong cluster
- Supporting → pillar (1 lần)
- Supporting ↔ supporting liên quan (nếu ngữ nghĩa phù hợp)

## Hướng dẫn sử dụng

1. **Khi viết bài MỚI**: Xác định bài thuộc cluster nào → đọc category hierarchy → áp dụng Topical Context Linking
2. **Khi refresh bài CŨ**: Kiểm tra bài đã context-link đúng hierarchy chưa → bổ sung nếu thiếu
3. **Khi thêm cluster MỚI**: Thêm section mới vào file này → cập nhật `keywords-urls.md`
4. **Internal Linking**: Đọc `keywords-urls.md` để biết bài nào đã publish → chèn link phù hợp
