Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A9B9C645E
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 23:39:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xp1YD1mt0z3bdW
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 09:38:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.97.181.73
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731384435;
	cv=none; b=K2eZoSFoaVJIXcp+WjUBrbUOi6bfsUVDsBHgya2WBZoAbHuntp2U7mZgUkVHQcjLW0P/eUDWkmfGdPxl6IceorG1bgbKV71xxbSoxmRyfXEamayYxpElX0CfhdGnKx4/JnXrsLZjV0M+NRalBLQdFAf1E7KZ7As2th5TMXikdG5QGA+mZQk8KeCPm3qfC67UU2DnwP0LL8nxKmrcluNB4ieKVmrgAGK8VaYaqwCS5X/GPUC2nt2DLH3CtU9bpBmtxPBHNT+Wr6vSWs25+Aabk+z9I353qOxHZdyhLuiHTWSM2BrX1gQC5hGW6osKwEnblTF334EhJ4aDk5D+I07Uvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731384435; c=relaxed/relaxed;
	bh=LKOzXwAAqgG001SrsHrnz81H436h8fmkOXy0ExiuGtU=;
	h=Date:From:To:Subject:Content-Type:MIME-Version:Message-ID; b=iCvqcmRZHX/RfKM6ponbSnONAudGUjPuYfxuz7k/2klFXNaFDFRWZg5Ai1ECH4LFUK09Px5ubKFr8We0xvqQ8n7S1fe70clZsQz1n0QdxlwCZ5dYc2S/wWcJ7QATTz3zhHq4Zww5XLUOoZPfHI1GDa4BnCeIIdjcovUWhSDHatu041znqUv01mzyU60ULAG6C64fSDxjZzaH2YulmzXSN3U1AXNnyIkfV4CYmcd9oNHlNX0DfsXllBFYFb8yCnyRfIQXE4TUm4tkWi952XoNLFfbXbRkHKMugX/6JcFsdCDbPeb+hUiep5OGpwwWrOF7lb3MPfpXZVn7gds5ziqV6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn; spf=pass (client-ip=209.97.181.73; helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net; envelope-from=yubowei0982@phytium.com.cn; receiver=lists.ozlabs.org) smtp.mailfrom=phytium.com.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=phytium.com.cn (client-ip=209.97.181.73; helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net; envelope-from=yubowei0982@phytium.com.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 749 seconds by postgrey-1.37 at boromir; Tue, 12 Nov 2024 15:07:11 AEDT
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnXtR2dyhz2xjL
	for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2024 15:07:08 +1100 (AEDT)
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwA3PR1s0TJnOc9PBA--.38279S2;
	Tue, 12 Nov 2024 11:54:20 +0800 (CST)
Received: from yubowei0982$phytium.com.cn (
 [240e:469:643:52a:884:79d8:99b0:12b1] ) by ajax-webmail-mail (Coremail) ;
 Tue, 12 Nov 2024 11:54:18 +0800 (GMT+08:00)
X-Originating-IP: [240e:469:643:52a:884:79d8:99b0:12b1]
Date: Tue, 12 Nov 2024 11:54:18 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5Za75p+P54Kc?= <yubowei0982@phytium.com.cn>
To: openbmc@lists.ozlabs.org
Subject: BMCWEB debug question
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT6 build
 20240812(cfb32469) Copyright (c) 2002-2024 www.mailtech.cn
 mispb-4edfefde-e422-4ddc-8a36-c3f99eb8cd32-icoremail.net
X-CM-CTRLDATA: e6j2WWZvb3Rlcl9odG09NjE0ODo0Njg=
Content-Type: multipart/alternative; 
	boundary="----=_Part_101098_575596761.1731383658415"
MIME-Version: 1.0
Message-ID: <18393666.6642.1931e8207af.Coremail.yubowei0982@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwDHHntr0TJnb5VOAA--.8563W
X-CM-SenderInfo: 51xe04lhlqmmus6sx5pwlxzhxfrphubq/1tbiAQAHE2cyYBAAvwAC
	sN
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=yubowei098
	2@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7WrWrWF48uw13Ar1UXF1UZFb_yoW8WrWkpF
	ZIkFy2qr4xJr18CrZYga4SqayaqFykGr43J34kGr17Zanrur12ka4av3s0va43uF12y3Wj
	vw4agF4DurWDuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 13 Nov 2024 09:38:53 +1100
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

------=_Part_101098_575596761.1731383658415
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8scG0KCgoKCkVhY2ggdGltZSBkZWJ1Z2luZyBhIGZ1bmNpb24gb2Ygb25lIGxpbmUgY29k
ZSB3aWxsIGNvc3QgbWUgdG9vIG11Y2ggdGltZS4KMS50eXBlICJiaXRiYWtlIGJtY3dlYiIsdGhp
cyBhY3Rpb24gd2lsbCBjb3N0IG1lIDUgbWludXRlcy4KMi5SZXBsYWNlIGJtY3dlYiBiaW5hcnkg
ZmlsZS4KMy5yZWJvb3QgYm1jd2ViLgoKVGhpcyBzZXJpZXJzIG9mIGFjdGlvbnMgY29zdCBtZSB0
b28gbXVjaCB0aW1lLkkgZG9uJ3QgdGhpbmsgaXQgaXMgYSByaWdodCBkZXZlbG9wIGZsb3cgYXMg
YSB3ZWIgZW5naW5lZXIuQ291bGQgdSBzaG93IG1lIHJpZ2h0IHdheSBmb3IgZGVidWdpbmc/CgoK
CgpUaGUgc2Vjb25kIHF1ZXN0aW9uIGlzIHRoYXQgSSBkaWRuJ3QgZmluZCBhbnkgYWN0aW9uIHJl
bGF0ZSB3aXRoICJtZXNvbiBzZXR1cCBidWlsZGRlciAmJiBuaW5qYSAiIGluIGJtY3dlYi5iYi5I
b3cgZG9lcyBpdCB3b3JrP2hvdyBjYW4gSSB1c2Ug4oCcSW5jcmVtZW50YWwgSW1wbGVtZW50YXRp
b27igJ0gdG8gZGVjcmVhc2Ugd2FzdGUgdGltZSBpbiBhY3Rpb24gImJpdGJha2UgYm1jd2ViIiB3
aGljaCBjb3N0IG1lIHRvbyBtdWNoIHRpbWUuCgoKCgpUaGUgdGhpcmQgcXVlc3Rpb24uRG9zZSBi
bWN3ZWIgaGF2ZSBIb3QgRGVwbG95bWVudCBtZXRob2Q/TXVzdCBJIHJlcGxhY2UgYmluYXJ5IGJt
Y3dlYiBpbiBvYm1jLXBob3NwaG9yLWltYWdlIGZvciBkZXRlY3R0aW5nIHdyaXRpbmcgcmVzdWx0
PwoKRG9zZSBpdCBleGlzdCBhIGZ1bmN0aW9uIHRvIGRldGVjdCByZXN1bHQgbW9yZSBjb252aW5l
bnRseSBsaWtlIG5wbSBydW4gc2VydmUgaW4gd2VidWktdnVlLHRoYXQgaXMgbW9yZSBjb252ZW5p
ZW50IGFuZCBtb3JlIHNhZmUuSXQgdXNlZCBwcm94eSBhbmQgd2lsbCBuZXZlciByZXBsYWNlIGJp
bmFyeSBmaWxlIGluIG9ibWMuCgoKCgpUaGFua3MhCgoK
------=_Part_101098_575596761.1731383658415
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHN0eWxlIGNsYXNzPSJrZS1zdHlsZSI+CltsaXN0LXN0eWxlLXR5cGVdIHtwYWRkaW5nLWxlZnQ6
MjBweDtsaXN0LXN0eWxlLXBvc2l0aW9uOmluc2lkZX0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkge21h
cmdpbjowfQpbbGlzdC1zdHlsZS10eXBlXSBsaTpiZWZvcmUsIHNwYW4ua2UtbGlzdC1pdGVtLW1h
dHRlciB7Zm9udC1mYW1pbHk6InNhbnMgc2VyaWYiLHRhaG9tYSx2ZXJkYW5hLGhlbHZldGljYX0K
W2xpc3Qtc3R5bGUtdHlwZV0gbGkgcCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoMSxbbGlzdC1zdHls
ZS10eXBlXSBsaSBoMixbbGlzdC1zdHlsZS10eXBlXSBsaSBoMyxbbGlzdC1zdHlsZS10eXBlXSBs
aSBoNCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoNSxbbGlzdC1zdHlsZS10eXBlXSBsaSBkaXYsW2xp
c3Qtc3R5bGUtdHlwZV0gbGkgYmxvY2txdW90ZXtkaXNwbGF5OmlubGluZTt3b3JkLWJyZWFrOmJy
ZWFrLWFsbH0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkgdGFibGUge2Rpc3BsYXk6aW5saW5lLWJsb2Nr
O3ZlcnRpY2FsLWFsaWduOnRvcH0KcHttYXJnaW46MH0KdGQge3dvcmQtYnJlYWs6IGJyZWFrLXdv
cmR9Ci5kZWZhdWx0LWZvbnQtMTczMTM4MzQxNzc3N3sKZm9udC1zaXplOjE0cHg7Cn0KPC9zdHls
ZT48ZGl2IGNsYXNzPSJkZWZhdWx0LWZvbnQtMTczMTM4MzQxNzc3NyIgZGlyPSJsdHIiPjxwIGRp
cj0iYXV0byIgc3R5bGU9ImJveC1zaXppbmc6Ym9yZGVyLWJveDttYXJnaW4tYm90dG9tOnZhcigt
LWJhc2Utc2l6ZS0xNik7Y29sb3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBC
bGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMm
cXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVt
b2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNr
Z3JvdW5kLWNvbG9yOiNGRkZGRkY7Ij5IZWxsbyxwbTwvcD48cCBkaXI9ImF1dG8iIHN0eWxlPSJi
b3gtc2l6aW5nOmJvcmRlci1ib3g7bWFyZ2luLWJvdHRvbTp2YXIoLS1iYXNlLXNpemUtMTYpO2Nv
bG9yOiMxRjIzMjg7Zm9udC1mYW1pbHk6LWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250
LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgJnF1b3Q7Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2Es
IEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7
U2Vnb2UgVUkgRW1vamkmcXVvdDs7dGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZG
RkZGOyI+PGJyPjwvcD48cCBkaXI9ImF1dG8iIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1ib3g7
bWFyZ2luLWJvdHRvbTp2YXIoLS1iYXNlLXNpemUtMTYpO2NvbG9yOiMxRjIzMjg7Zm9udC1mYW1p
bHk6LWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90
OywgJnF1b3Q7Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAm
cXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7
dGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+RWFjaCB0aW1lIGRlYnVn
aW5nIGEgZnVuY2lvbiBvZiBvbmUgbGluZSBjb2RlIHdpbGwgY29zdCBtZSB0b28gbXVjaCB0aW1l
LjxiciBzdHlsZT0iYm94LXNpemluZzpib3JkZXItYm94OyI+MS50eXBlICJiaXRiYWtlIGJtY3dl
YiIsdGhpcyBhY3Rpb24gd2lsbCBjb3N0IG1lIDUgbWludXRlcy48YnIgc3R5bGU9ImJveC1zaXpp
bmc6Ym9yZGVyLWJveDsiPjIuUmVwbGFjZSBibWN3ZWIgYmluYXJ5IGZpbGUuPGJyIHN0eWxlPSJi
b3gtc2l6aW5nOmJvcmRlci1ib3g7Ij4zLnJlYm9vdCBibWN3ZWIuPC9wPjxwIGRpcj0iYXV0byIg
c3R5bGU9ImJveC1zaXppbmc6Ym9yZGVyLWJveDttYXJnaW4tYm90dG9tOnZhcigtLWJhc2Utc2l6
ZS0xNik7Y29sb3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5
c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhl
bHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7
LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNv
bG9yOiNGRkZGRkY7Ij5UaGlzIHNlcmllcnMgb2YgYWN0aW9ucyBjb3N0IG1lIHRvbyBtdWNoIHRp
bWUuSSBkb24ndCB0aGluayBpdCBpcyBhIHJpZ2h0IGRldmVsb3AgZmxvdyBhcyBhIHdlYiBlbmdp
bmVlci5Db3VsZCB1IHNob3cgbWUgcmlnaHQgd2F5IGZvciBkZWJ1Z2luZz88L3A+PHAgZGlyPSJh
dXRvIiBzdHlsZT0iYm94LXNpemluZzpib3JkZXItYm94O21hcmdpbi1ib3R0b206dmFyKC0tYmFz
ZS1zaXplLTE2KTtjb2xvcjojMUYyMzI4O2ZvbnQtZmFtaWx5Oi1hcHBsZS1zeXN0ZW0sIEJsaW5r
TWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90O05vdG8gU2FucyZxdW90
OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkm
cXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7O3RleHQtd3JhcDp3cmFwO2JhY2tncm91
bmQtY29sb3I6I0ZGRkZGRjsiPjxicj48L3A+PHAgZGlyPSJhdXRvIiBzdHlsZT0iYm94LXNpemlu
Zzpib3JkZXItYm94O21hcmdpbi1ib3R0b206dmFyKC0tYmFzZS1zaXplLTE2KTtjb2xvcjojMUYy
MzI4O2ZvbnQtZmFtaWx5Oi1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7
U2Vnb2UgVUkmcXVvdDssICZxdW90O05vdG8gU2FucyZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwg
c2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJ
IEVtb2ppJnF1b3Q7O3RleHQtd3JhcDp3cmFwO2JhY2tncm91bmQtY29sb3I6I0ZGRkZGRjsiPlRo
ZSBzZWNvbmQgcXVlc3Rpb24gaXMgdGhhdCBJIGRpZG4ndCBmaW5kIGFueSBhY3Rpb24gcmVsYXRl
IHdpdGggIm1lc29uIHNldHVwIGJ1aWxkZGVyICZhbXA7JmFtcDsgbmluamEgIiBpbiBibWN3ZWIu
YmIuSG93IGRvZXMgaXQgd29yaz9ob3cgY2FuIEkgdXNlIOKAnEluY3JlbWVudGFsIEltcGxlbWVu
dGF0aW9u4oCdIHRvIGRlY3JlYXNlIHdhc3RlIHRpbWUgaW4gYWN0aW9uICJiaXRiYWtlIGJtY3dl
YiIgd2hpY2ggY29zdCBtZSB0b28gbXVjaCB0aW1lLjwvcD48cCBkaXI9ImF1dG8iIHN0eWxlPSJi
b3gtc2l6aW5nOmJvcmRlci1ib3g7bWFyZ2luLWJvdHRvbTp2YXIoLS1iYXNlLXNpemUtMTYpO2Nv
bG9yOiMxRjIzMjg7Zm9udC1mYW1pbHk6LWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250
LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgJnF1b3Q7Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2Es
IEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7
U2Vnb2UgVUkgRW1vamkmcXVvdDs7dGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZG
RkZGOyI+PGJyPjwvcD48cCBkaXI9ImF1dG8iIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1ib3g7
bWFyZ2luLWJvdHRvbTp2YXIoLS1iYXNlLXNpemUtMTYpO2NvbG9yOiMxRjIzMjg7Zm9udC1mYW1p
bHk6LWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90
OywgJnF1b3Q7Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAm
cXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7
dGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+VGhlIHRoaXJkIHF1ZXN0
aW9uLkQ8c3BhbiBzdHlsZT0iY29sb3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVt
LCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNh
bnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9y
IEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDti
YWNrZ3JvdW5kLWNvbG9yOiNGRkZGRkY7Ij5vc2UgYm1jd2ViIGhhdmUgSG90IERlcGxveW1lbnQg
bWV0aG9kPzxzcGFuIHN0eWxlPSJjb2xvcjojMUYyMzI4O2ZvbnQtZmFtaWx5Oi1hcHBsZS1zeXN0
ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90O05vdG8g
U2FucyZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29s
b3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7O3RleHQtd3JhcDp3cmFw
O2JhY2tncm91bmQtY29sb3I6I0ZGRkZGRjsiPk11c3QgSSByZXBsYWNlIGJpbmFyeSBibWN3ZWIg
aW4gb2JtYy1waG9zcGhvci1pbWFnZSBmb3IgZGV0ZWN0dGluZyB3cml0aW5nIHJlc3VsdD88L3Nw
YW4+PC9zcGFuPjwvcD48cD48c3BhbiBzdHlsZT0iY29sb3I6IzFGMjMyODtmb250LWZhbWlseTot
YXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAm
cXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90
O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0
LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNvbG9yOiNGRkZGRkY7Ij5Eb3NlIGl0IGV4aXN0IGEgZnVu
Y3Rpb24gdG8gZGV0ZWN0IHJlc3VsdCBtb3JlIGNvbnZpbmVudGx5IGxpa2UgbnBtIHJ1biBzZXJ2
ZSBpbiB3ZWJ1aS12dWUsdGhhdCBpcyBtb3JlIGNvbnZlbmllbnQgYW5kIG1vcmUgc2FmZS5JdCB1
c2VkIHByb3h5IGFuZCB3aWxsIG5ldmVyIHJlcGxhY2UgYmluYXJ5IGZpbGUgaW4gb2JtYy48L3Nw
YW4+PC9wPjxwPjxiciBzdHlsZT0iYm94LXNpemluZzpib3JkZXItYm94O2NvbG9yOiMxRjIzMjg7
Zm9udC1mYW1pbHk6LWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdv
ZSBVSSZxdW90OywgJnF1b3Q7Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5z
LXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1v
amkmcXVvdDs7dGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+PC9wPjxw
PjxzcGFuIHN0eWxlPSJjb2xvcjojMUYyMzI4O2ZvbnQtZmFtaWx5Oi1hcHBsZS1zeXN0ZW0sIEJs
aW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90O05vdG8gU2FucyZx
dW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1v
amkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7O3RleHQtd3JhcDp3cmFwO2JhY2tn
cm91bmQtY29sb3I6I0ZGRkZGRjsiPlRoYW5rcyE8L3NwYW4+PC9wPjxwIGRpcj0iYXV0byIgc3R5
bGU9ImJveC1zaXppbmc6Ym9yZGVyLWJveDttYXJnaW4tYm90dG9tOnZhcigtLWJhc2Utc2l6ZS0x
Nik7Y29sb3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3Rl
bUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZl
dGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAm
cXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNvbG9y
OiNGRkZGRkY7Ij48c3BhbiBzdHlsZT0iY29sb3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUt
c3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtO
b3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxl
IENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6
d3JhcDtiYWNrZ3JvdW5kLWNvbG9yOiNGRkZGRkY7Ij48L3NwYW4+PGJyPjwvcD48L2Rpdj48YnI+
PGJyPjxpIHN0eWxlPSJjb2xvcjogcmdiKDExOSwgMTE5LCAxMTkpOyBmb250LWZhbWlseTog5a6L
5L2TOyBmb250LXNpemU6IHgtc21hbGw7Ij7kv6Hmga/lronlhajlo7DmmI7vvJrmnKzpgq7ku7bl
jIXlkKvkv6Hmga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tnu4fmiYDmnIks5Y+R5Lu25Lq65omA5Zyo
57uE57uH5a+56K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS26ICF5rOo5oSP
5L+d5a+GLOacque7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vkvZXnrKzkuInm
lrnnu4Tnu4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvkv6Hmga/jgII8YnI+SW5mb3Jt
YXRpb24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
bWFpbCBpcyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRlcidzIG9yZ2FuaXphdGlvbi5UaGlz
IG1haWwgY29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRpYWwuUmVjaXBpZW50cyBuYW1lZCBhYm92
ZSBhcmUgb2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kgYW5kIGFyZSBub3QgcGVybWl0dGVk
IHRvIGRpc2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJz
LjwvaT4=
------=_Part_101098_575596761.1731383658415--

