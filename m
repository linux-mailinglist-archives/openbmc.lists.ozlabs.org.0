Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E45B42EBAEC
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 09:03:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9hgR1k4szDqLj
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 19:02:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lx5O8lQl; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9hfm5b9tzDqWF
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 19:02:18 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id i5so1728755pgo.1
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jan 2021 00:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language;
 bh=ekvCPyjizgc5EqIkImarn30z0YdqJ0U9YLjjhnaE9Hc=;
 b=lx5O8lQlh2kNDC3bOdUkESNlKfA1Tn/ZmMIMkR7S2YkfrAiE2LFuVX1P6AMgAiLQV+
 Ya/XH2e29ksUqMwtuc8uDxWv9wWg89FCBnwGaElp/hj6acPoUf9joNDPvoSCOw5n2bVr
 h9AXFKZkWASwy2OeifDmcHXDP0redOJMPU1u57yq2W78jaB45VWdbcNeeeR77Psrb2/4
 QW6FKrZVyRpnx7bH8kzjvPI89GHnvabNyoYYWBocDIa29kIvIRqKZq9pwelvPYg6l095
 wtznReaXYcMUZ+9y7v2fzIg/+fVxKBToJlMJgRAlp+eQkvM4PsqbkYw3OqJ64S1bWILr
 PdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language;
 bh=ekvCPyjizgc5EqIkImarn30z0YdqJ0U9YLjjhnaE9Hc=;
 b=Td4zZgWKrPN9upRfgYS70o89v8f7GmQiNvoLeBS6lSil7tm/o5MiEXsnGj0syN+Zcs
 Tp4NERWU5G7rS0QMP1cYSvZapCjqrA7G1aBl6fhV3EPDXA9MvKjANd/5CosC0vgNlIYh
 BcoBEgtVtf+eq6RUMYpOAQ/zVLEKKms1ZhNW+0rOFCbmg0oB3+stK92T4orRqLgTPMer
 LiI1ZTUtBa25Wv2J9y+2vjfU/pP6teEzn6WaTetZsKBXC87XuBRrh+o+BddLAK4rw3+Q
 i37B8YEO8rdv8Cn4RRebbICF0bXLAM9qfBLDp9uRWlg8v43ea6BV2wuYvV7EbrblaQ99
 Ajyg==
X-Gm-Message-State: AOAM532HZ6oNMt3lgK/je/wwxfit0GZ4DxcrWlBuQgw7czZr6ngadLfx
 GhbN8EjITsdjJHYQ6RBdxlM=
X-Google-Smtp-Source: ABdhPJwSXEfZo6lXgR6HLHLDLqRyW/s+ifDAMlXFgS9la8DyTHh41VF2Boy2wSU19POsBCFcn4DNTw==
X-Received: by 2002:a63:d214:: with SMTP id a20mr3276004pgg.63.1609920135341; 
 Wed, 06 Jan 2021 00:02:15 -0800 (PST)
Received: from [192.168.0.104] ([124.123.107.122])
 by smtp.gmail.com with ESMTPSA id h8sm1660001pjc.2.2021.01.06.00.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 00:02:14 -0800 (PST)
From: Sunitha Harish <sunithaharish04@gmail.com>
Subject: pthreads at bmcweb
To: openbmc@lists.ozlabs.org
Message-ID: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
Date: Wed, 6 Jan 2021 13:32:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------B3ADF75EE1EA5EDB80293778"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: edtanous@google.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------B3ADF75EE1EA5EDB80293778
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi team,

Reference commit 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31735 :

In order to handle the multiple push-style event subscribers, bmc needs 
to support the async resolution of the subscribers address. The 
async_resolve() API crashes if there is no thread support in the binary.

I created a bmcweb binary patch by pulling this commit and including the 
pthread. This works fine for the use-cases, but increased the bmcweb 
binary size by 220KB.

Ed's suggestion is not to use the pthreads, instead implement 
alternatives to do the same job, so that the binary size is kept 
minimum. He mentioned: /"//Considering that's a ~30% increase in binary 
size to support one line off code, and most systems are already at their 
binary size limit, no, that's not going to be acceptable. We can either 
patch boost to use this 
//https://man7.org/linux/man-pages/man3/getaddrinfo_a.3.html 
<https://man7.org/linux/man-pages/man3/getaddrinfo_a.3.html>//or we 
could build our own resolver type that calls that underneath. This was 
based on a quick lookthrough of solutions in Google. I'm open to other 
ideas here". /

I am looking for the community views about the increased bmcweb binary 
size v/s having a custom implementation for asyc_resolve. Please share 
your views & ideas to get to the best solution.


Thanks & regards,
Sunitha



--------------B3ADF75EE1EA5EDB80293778
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+DQogIDxoZWFkPg0KDQogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBl
IiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPg0KICA8L2hlYWQ+DQogIDxi
b2R5Pg0KICAgIEhpIHRlYW0sPGJyPg0KICAgIDxwPlJlZmVyZW5jZSBjb21taXQNCiAgICAg
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2Vycml0
Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL2JtY3dlYi8rLzMxNzM1Ij5odHRwczov
L2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9ibWN3ZWIvKy8zMTczNTwv
YT4gOjwvcD4NCiAgICA8cD5JbiBvcmRlciB0byBoYW5kbGUgdGhlIG11bHRpcGxlIHB1c2gt
c3R5bGUgZXZlbnQgc3Vic2NyaWJlcnMsIGJtYw0KICAgICAgbmVlZHMgdG8gc3VwcG9ydCB0
aGUgYXN5bmMgcmVzb2x1dGlvbiBvZiB0aGUgc3Vic2NyaWJlcnMgYWRkcmVzcy4NCiAgICAg
IFRoZSBhc3luY19yZXNvbHZlKCkgQVBJIGNyYXNoZXMgaWYgdGhlcmUgaXMgbm8gdGhyZWFk
IHN1cHBvcnQgaW4NCiAgICAgIHRoZSBiaW5hcnkuIDwvcD4NCiAgICA8cD5JIGNyZWF0ZWQg
YSBibWN3ZWIgYmluYXJ5IHBhdGNoIGJ5IHB1bGxpbmcgdGhpcyBjb21taXQgYW5kDQogICAg
ICBpbmNsdWRpbmcgdGhlIHB0aHJlYWQuIFRoaXMgd29ya3MgZmluZSBmb3IgdGhlIHVzZS1j
YXNlcywgYnV0DQogICAgICBpbmNyZWFzZWQgdGhlIGJtY3dlYiBiaW5hcnkgc2l6ZSBieSAy
MjBLQi4gPC9wPg0KICAgIEVkJ3Mgc3VnZ2VzdGlvbiBpcyBub3QgdG8gdXNlIHRoZSBwdGhy
ZWFkcywgaW5zdGVhZCBpbXBsZW1lbnQNCiAgICBhbHRlcm5hdGl2ZXMgdG8gZG8gdGhlIHNh
bWUgam9iLCBzbyB0aGF0IHRoZSBiaW5hcnkgc2l6ZSBpcyBrZXB0DQogICAgbWluaW11bS4g
SGUgbWVudGlvbmVkOiA8aT4iPC9pPjxpPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDMzLCAz
MywgMzMpOyBmb250LWZhbWlseTogUm9ib3RvLCAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5
c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5z
LXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkg
RW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIFN5bWJvbCZxdW90OzsgZm9udC1zaXplOiAx
NHB4OyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBz
OiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRl
eHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9u
ZTsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10
ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOiBpbml0
aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1j
b2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25l
OyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzMsIDMzLCAzMyk7IGZvbnQtZmFtaWx5OiBS
b2JvdG8sIC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2Ug
VUkmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENv
bG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90OywgJnF1b3Q7U2Vn
b2UgVUkgU3ltYm9sJnF1b3Q7OyBmb250LXNpemU6IDE0cHg7IGZvbnQtdmFyaWFudC1saWdh
dHVyZXM6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6
IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQt
aW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogcHJlLXdy
YXA7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7
IHRleHQtZGVjb3JhdGlvbi10aGlja25lc3M6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1z
dHlsZTogaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyBkaXNwbGF5
OiBpbmxpbmUgIWltcG9ydGFudDsgZmxvYXQ6IG5vbmU7Ij5Db25zaWRlcmluZyB0aGF0J3Mg
YSB+MzAlIGluY3JlYXNlIGluIGJpbmFyeSBzaXplIHRvIHN1cHBvcnQgb25lIGxpbmUgb2Zm
IGNvZGUsIGFuZCBtb3N0IHN5c3RlbXMgYXJlIGFscmVhZHkgYXQgdGhlaXIgYmluYXJ5IHNp
emUgbGltaXQsIG5vLCB0aGF0J3Mgbm90IGdvaW5nIHRvIGJlIGFjY2VwdGFibGUuIDwvc3Bh
bj5XZSBjYW4gZWl0aGVyIHBhdGNoIGJvb3N0IHRvIHVzZSB0aGlzDQo8L3NwYW4+PC9pPjxp
PjxhIGhyZWY9Imh0dHBzOi8vbWFuNy5vcmcvbGludXgvbWFuLXBhZ2VzL21hbjMvZ2V0YWRk
cmluZm9fYS4zLmh0bWwiIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIiBzdHlsZT0i
Ym9yZGVyOiAwcHggbm9uZTsgYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC12YXJpYW50
LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXZh
cmlhbnQtbnVtZXJpYzogaW5oZXJpdDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IGluaGVy
aXQ7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtc3RyZXRjaDogaW5oZXJpdDsgZm9udC1zaXpl
OiAxNHB4OyBsaW5lLWhlaWdodDogaW5oZXJpdDsgZm9udC1mYW1pbHk6IFJvYm90bywgLWFw
cGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90Oywg
SGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkm
cXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBTeW1i
b2wmcXVvdDs7IG1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IHZlcnRpY2FsLWFsaWduOiBi
YXNlbGluZTsgY29sb3I6IHZhcigtLWxpbmstY29sb3IpOyBsZXR0ZXItc3BhY2luZzogbm9y
bWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zv
cm06IG5vbmU7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC1zcGFjaW5nOiAwcHg7IC13
ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsiPmh0dHBzOi8vbWFuNy5vcmcvbGludXgv
bWFuLXBhZ2VzL21hbjMvZ2V0YWRkcmluZm9fYS4zLmh0bWw8L2E+PC9pPjxpPjxzcGFuIHN0
eWxlPSJjb2xvcjogcmdiKDMzLCAzMywgMzMpOyBmb250LWZhbWlseTogUm9ib3RvLCAtYXBw
bGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBI
ZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZx
dW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIFN5bWJv
bCZxdW90OzsgZm9udC1zaXplOiAxNHB4OyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3Jt
YWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRl
ci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4
OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyB3b3JkLXNw
YWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29y
YXRpb24tdGhpY2tuZXNzOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRp
YWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFp
bXBvcnRhbnQ7IGZsb2F0OiBub25lOyI+IG9yIHdlIGNvdWxkIGJ1aWxkIG91ciBvd24gcmVz
b2x2ZXIgdHlwZSB0aGF0IGNhbGxzIHRoYXQgdW5kZXJuZWF0aC4gIFRoaXMgd2FzIGJhc2Vk
IG9uIGEgcXVpY2sgbG9va3Rocm91Z2ggb2Ygc29sdXRpb25zIGluIEdvb2dsZS4gIEknbSBv
cGVuIHRvIG90aGVyIGlkZWFzIGhlcmUiLiA8L3NwYW4+PC9pPjxicj4NCiAgICA8cD5JIGFt
IGxvb2tpbmcgZm9yIHRoZSBjb21tdW5pdHkgdmlld3MgYWJvdXQgdGhlIGluY3JlYXNlZCBi
bWN3ZWINCiAgICAgIGJpbmFyeSBzaXplIHYvcyBoYXZpbmcgYSBjdXN0b20gaW1wbGVtZW50
YXRpb24gZm9yIGFzeWNfcmVzb2x2ZS4NCiAgICAgIFBsZWFzZSBzaGFyZSB5b3VyIHZpZXdz
ICZhbXA7IGlkZWFzIHRvIGdldCB0byB0aGUgYmVzdCBzb2x1dGlvbi48YnI+DQogICAgPC9w
Pg0KICAgIDxicj4NCiAgICBUaGFua3MgJmFtcDsgcmVnYXJkcyw8YnI+DQogICAgU3VuaXRo
YTxicj4NCiAgICA8cD48YnI+DQogICAgPC9wPg0KICA8L2JvZHk+DQo8L2h0bWw+DQo=
--------------B3ADF75EE1EA5EDB80293778--
