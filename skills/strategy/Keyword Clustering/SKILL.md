# Keyword Clustering — Phân cụm từ khoá

## 1. Purpose / Mục đích
Keyword Clustering biến danh sách keyword phẳng thành **cụm chủ đề (clusters)**, mỗi cụm tương ứng **một URL duy nhất**. Đây là bước bắt buộc giữa Keyword Research và Content Plan. Làm đúng → tránh cannibalization, tăng topical authority, tối ưu chi phí content. Làm sai → 10 bài đánh nhau cho 1 keyword.

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 Hai trường phái clustering
- **Semantic clustering**: nhóm theo nghĩa / lemma / embedding.
  - Ưu: nhanh, scale tốt cho list 10.000+ keyword.
  - Nhược: Google không luôn chia SERP theo nghĩa — 2 keyword nghe khác nhau có thể cùng SERP.
- **SERP-based clustering** (recommend): nhóm 2 keyword nếu top 10 chia sẻ ≥ N URL (thường N = 3–4).
  - Ưu: phản ánh đúng cách Google "nghĩ".
  - Nhược: tốn API, chậm hơn.

→ **Best practice**: SERP-based làm chính, semantic làm phụ để gom các cluster nhỏ.

### 2.2 Pillar vs Cluster keyword
- **Head/Pillar keyword**: SV cao, KD cao, intent rộng → trang pillar.
- **Cluster keyword (supporting)**: long-tail, intent hẹp → các bài blog vệ tinh, link nội bộ về pillar.

### 2.3 Một URL = một intent dominant
Một bài không thể serve 3 intent khác nhau. Nếu cluster có nhiều intent → tách cluster.

## 3. When to use
- Sau khi có Keyword List (≥ 200 keyword).
- Khi audit site phát hiện cannibalization.
- Khi xây Topic Cluster / Pillar Page architecture.
- Khi merge 2 site / migrate domain.

## 4. Workflow 5 bước

### Bước 1. Chuẩn hoá danh sách keyword
- Bỏ duplicate, lower-case, trim space.
- Lọc keyword off-topic, brand đối thủ không cần làm.
- Giữ cột: keyword, SV, KD, intent (đã gắn từ skill Search Intent).

### Bước 2. SERP-based clustering
Cách thủ công (cho ≤ 100 keyword):
- Search từng keyword → ghi 10 URL top.
- 2 keyword chia sẻ ≥ 3 URL chung → cùng cluster.

Cách tự động:
- **Keyword Insights** (paid): nhập CSV, set overlap threshold 3 hoặc 4, soft/hard mode.
- **Cluster.ai**, **Surfer Cluster**, **Outranking**: tương tự.
- Self-hosted: scraper SERP (SerpAPI / DataForSEO) + Python (sklearn DBSCAN / connected components).

Threshold gợi ý:
- Overlap = 3: cluster lỏng, phù hợp content TOFU.
- Overlap = 4–5: cluster chặt, phù hợp money page.

### Bước 3. Đặt tên & chọn pillar keyword cho cluster
Mỗi cluster:
- Pillar keyword = keyword SV cao nhất + intent rộng nhất.
- Đặt tên cluster theo pillar (slug-friendly).
- Ghi chú dominant intent của cluster.

### Bước 4. Validate intent đồng nhất
Trong 1 cluster, nếu có keyword intent khác (ví dụ informational + transactional cùng nhau) → tách thành 2 cluster con. Đừng để 1 URL phải gánh 2 mục tiêu funnel.

### Bước 5. Map cluster → URL plan
- Pillar cluster → 1 pillar page (hub).
- Sub-cluster → 1 supporting blog/landing.
- URL slug = pillar keyword (kebab-case).
- Internal link plan: mỗi sub-page link về pillar; pillar link xuống các sub-page.
- Ghi cluster vào Content Plan.

## 5. Template Sheet

Tab **Clusters**:
| Cluster name | Pillar KW | Total SV | Avg KD | Intent | # supporting KW | Target URL | Status |

Tab **Mapped Keywords**:
| Keyword | SV | KD | Intent | Cluster | Pillar (Y/N) | Target URL |

## 6. KPI đo lường
- % keyword đã được cluster / total list.
- # cluster đã có content publish / total cluster.
- Avg SoV theo cluster.
- # cannibalization issue được phát hiện & sửa.
- Topical authority score (theo Ahrefs/Semrush hoặc proprietary metric).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Keyword Insights | Paid | SERP-based clustering, soft/hard, intent tag |
| SurferSEO Cluster | Paid | Cluster + content brief tích hợp |
| Outranking, ClusterAI, LowFruits | Paid | Alternatives |
| Ahrefs (Parent Topic) | Paid | Cluster proxy nhanh |
| Python + DataForSEO/SerpAPI | Custom | Self-host nếu volume rất lớn |
| Google Sheets + GPT | Freemium | Cluster thủ công với prompt LLM |
| ChatGPT/Claude | Freemium | Tag, đặt tên cluster, viết brief |

### Prompt LLM clustering nhanh (≤ 200 keyword)
```
Bạn là chuyên gia SEO. Với danh sách keyword sau, hãy phân cụm theo intent + ngữ nghĩa. Mỗi cluster: tên cluster, pillar keyword, danh sách supporting keyword, dominant intent. Trả về JSON.
[paste list]
```

## 8. Common mistakes
- Chỉ semantic clustering → lệch SERP thực tế.
- Cluster quá lớn (50+ keyword/cluster) → 1 bài không thể cover hết.
- Cluster quá nhỏ (1–2 keyword) → fragment site, lãng phí crawl budget.
- Trộn intent khác nhau trong 1 cluster.
- Quên kiểm tra cannibalization với content cũ trên site.
- Không cập nhật cluster sau Google update — SERP có thể merge/split.
- Chọn pillar keyword theo SV cao mà bỏ qua intent rộng → pillar không cover được supporting.

---
**Đầu ra**: bảng cluster có pillar + supporting + URL target, là input trực tiếp cho Topic Clusters & Pillar Pages.
