Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 858F219AB26
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 13:57:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sl7c4Ss0zDqRh
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 22:57:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.51; helo=m13-51.163.com;
 envelope-from=zhang_cy1989@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=KWmYqSTJ; dkim-atps=neutral
Received: from m13-51.163.com (m13-51.163.com [220.181.13.51])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sl6N3flqzDqNT
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 22:56:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=IF4IV
 0aYCvFVJbi8gRpW1/a3h6yChdNNA62Y0ctEP/c=; b=KWmYqSTJXTCQRix1i9YXd
 xWRuhKUtsjeHxSEeu6/udUqXNdZAnNsFJjw8mDIzo4K17XN3+40zOcOiASwgA+Nt
 LCRfAFAYlIkTKXfgcrExQrXLflnsQcBNiMqG1PIEXE0CGjiPkqc1lMy9/CCWB/S8
 k/eUFy3oZz+1TNWppOxdNs=
Received: from zhang_cy1989$163.com ( [111.199.188.155] ) by
 ajax-webmail-wmsvr51 (Coremail) ; Wed, 1 Apr 2020 19:56:32 +0800 (CST)
X-Originating-IP: [111.199.188.155]
Date: Wed, 1 Apr 2020 19:56:32 +0800 (CST)
From: zhang_cy1989 <zhang_cy1989@163.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Can't not find interface "xyz.openbmc_project.Logging.Entry" in
 intel wolfpass
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: 3aNe02Zvb3Rlcl9odG09MTgyMDo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_202481_2116703840.1585742192107"
MIME-Version: 1.0
Message-ID: <472f36ef.d33d.17135999deb.Coremail.zhang_cy1989@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: M8GowACnJh1wgYRefjURAA--.38547W
X-CM-SenderInfo: x2kd0w5bf1imiyz6il2tof0z/xtbBFRD4T1XlkMhH3QAAsA
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_202481_2116703840.1585742192107
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBBbGwKICAgICBJIHVzZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQgaW5zaWRlIEJNQywgYnV0
IHJldHVybiBlbXB0eS4KICAgICBkYnVzLXNlbmQgLS1zeXN0ZW0gLS1wcmludC1yZXBseSAtLWRl
c3Q9eHl6Lm9wZW5ibWNfcHJvamVjdC5PYmplY3RNYXBwZXIgL3h5ei9vcGVuYm1jX3Byb2plY3Qv
b2JqZWN0X21hcHBlciB4eXoub3BlbmJtY19wcm9qZWN0Lk9iamVjdE1hcHBlci5HZXRTdWJUcmVl
UGF0aHMgc3RyaW5nOiIvIiBpbnQzMjowIGFycmF5OnN0cmluZzoieHl6Lm9wZW5ibWNfcHJvamVj
dC5Mb2dnaW5nLkVudHJ5IgoKCm1ldGhvZCByZXR1cm4gdGltZT01ODk2LjczMTYyMSBzZW5kZXI9
OjEuMjcgLT4gZGVzdGluYXRpb249OjEuMTQxIHNlcmlhbD0xNDI1IHJlcGx5X3NlcmlhbD0yCiAg
IGFycmF5IFsKICAgXQogICAKCiAgICBIb3dldmVyLCBJIHVzZSBpcG1pdG9vbCB0byBnZXQgc2Vs
IGxpc3QgaW4gYW5vdGhlciBjb21wdXRlciBhbmQgZ290IHRob3NlIGluZm86CgogICAxIHwgIFBy
ZS1Jbml0ICB8MDAwMDAwMDEyMXwgVGVtcGVyYXR1cmUgIzB4MGIgfCBMb3dlciBOb24tY3JpdGlj
YWwgZ29pbmcgbG93ICB8IEFzc2VydGVkCiAgIDIgfCAgUHJlLUluaXQgIHwwMDAwMDAwMTAxfCBU
ZW1wZXJhdHVyZSAjMHgwYiB8IExvd2VyIE5vbi1jcml0aWNhbCBnb2luZyBsb3cgIHwgQXNzZXJ0
ZWQKICAgMyB8ICBQcmUtSW5pdCAgfDAwMDAwMDAwOTh8IFRlbXBlcmF0dXJlICMweDBiIHwgTG93
ZXIgTm9uLWNyaXRpY2FsIGdvaW5nIGxvdyAgfCBBc3NlcnRlZAoKCiAgIEkgY2FuJ3QgZmluZCBp
bnRlcmZhY2UgInh5ei5vcGVuYm1jX3Byb2plY3QuTG9nZ2luZy5FbnRyeSIgYW5kIGNhbiBnZXQg
c2VsIGxpc3QgYnkgaXBtaXRvb2wsIHdoeT8KICAgV2hvIGNvdWxkIGhlbHAgbWU/IHdhaXRpbmcg
Zm9yIHlvdS4KICAgVGhhbmtzCgoKQlIKRmVsaXgK
------=_Part_202481_2116703840.1585742192107
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+RGVhciBBbGw8L2Rpdj48
ZGl2IHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBJIHVzZSB0aGUg
Zm9sbG93aW5nIGNvbW1hbmQgaW5zaWRlIEJNQywgYnV0IHJldHVybiBlbXB0eS48L2Rpdj48ZGl2
IHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBkYnVzLXNlbmQgLS1z
eXN0ZW0gLS1wcmludC1yZXBseSAtLWRlc3Q9eHl6Lm9wZW5ibWNfcHJvamVjdC5PYmplY3RNYXBw
ZXIgL3h5ei9vcGVuYm1jX3Byb2plY3Qvb2JqZWN0X21hcHBlciB4eXoub3BlbmJtY19wcm9qZWN0
Lk9iamVjdE1hcHBlci5HZXRTdWJUcmVlUGF0aHMgc3RyaW5nOiIvIiBpbnQzMjowIGFycmF5OnN0
cmluZzoiPHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJnYigyMjEsIDY0LCA1MCk7Ij54
eXoub3BlbmJtY19wcm9qZWN0LkxvZ2dpbmcuRW50cnk8L3NwYW4+IjwvZGl2PjxkaXYgc3R5bGU9
Im1hcmdpbjowOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+PHNwYW4gc3R5bGU9
ImJhY2tncm91bmQtY29sb3I6IHJnYigyMjEsIDY0LCA1MCk7Ij5tZXRob2QgcmV0dXJuIHRpbWU9
NTg5Ni43MzE2MjEgc2VuZGVyPToxLjI3IC0mZ3Q7IGRlc3RpbmF0aW9uPToxLjE0MSBzZXJpYWw9
MTQyNSByZXBseV9zZXJpYWw9Mjxicj4mbmJzcDsmbmJzcDsgYXJyYXkgWzxicj4mbmJzcDsmbmJz
cDsgXTwvc3Bhbj48YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxicj48L2Rpdj48ZGl2IHN0eWxlPSJt
YXJnaW46MDsiPiZuYnNwOyZuYnNwOyZuYnNwOyBIb3dldmVyLCBJIHVzZSBpcG1pdG9vbCB0byBn
ZXQgc2VsIGxpc3QgaW4gYW5vdGhlciBjb21wdXRlciBhbmQgZ290IHRob3NlIGluZm86PC9kaXY+
PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij48YnI+Jm5ic3A7Jm5ic3A7IDEgfCZuYnNwOyBQcmUtSW5p
dCZuYnNwOyB8MDAwMDAwMDEyMXwgVGVtcGVyYXR1cmUgIzB4MGIgfCBMb3dlciBOb24tY3JpdGlj
YWwgZ29pbmcgbG93Jm5ic3A7IHwgQXNzZXJ0ZWQ8YnI+Jm5ic3A7Jm5ic3A7IDIgfCZuYnNwOyBQ
cmUtSW5pdCZuYnNwOyB8MDAwMDAwMDEwMXwgVGVtcGVyYXR1cmUgIzB4MGIgfCBMb3dlciBOb24t
Y3JpdGljYWwgZ29pbmcgbG93Jm5ic3A7IHwgQXNzZXJ0ZWQ8YnI+Jm5ic3A7Jm5ic3A7IDMgfCZu
YnNwOyBQcmUtSW5pdCZuYnNwOyB8MDAwMDAwMDA5OHwgVGVtcGVyYXR1cmUgIzB4MGIgfCBMb3dl
ciBOb24tY3JpdGljYWwgZ29pbmcgbG93Jm5ic3A7IHwgQXNzZXJ0ZWQ8L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46MDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyZuYnNw
OyBJIGNhbid0IGZpbmQgaW50ZXJmYWNlICI8c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjog
cmdiKDIyMSwgNjQsIDUwKTsiPnh5ei5vcGVuYm1jX3Byb2plY3QuTG9nZ2luZy5FbnRyeTwvc3Bh
bj4iIGFuZCBjYW4gZ2V0IHNlbCBsaXN0IGJ5IGlwbWl0b29sLCB3aHk/PC9kaXY+PGRpdiBzdHls
ZT0ibWFyZ2luOjA7Ij4mbmJzcDsmbmJzcDsgV2hvIGNvdWxkIGhlbHAgbWU/IHdhaXRpbmcgZm9y
IHlvdS48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyZuYnNwOyBUaGFua3M8L2Rp
dj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsi
PkJSPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5GZWxpeDxicj48L2Rpdj48L2Rpdj48YnI+
PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_202481_2116703840.1585742192107--

