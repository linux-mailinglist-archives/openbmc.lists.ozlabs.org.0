Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073012A851
	for <lists+openbmc@lfdr.de>; Wed, 25 Dec 2019 15:18:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jZv26mT9zDqLP
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 01:18:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e8AEmKIc"; 
 dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jZtJ56SyzDqKP
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 01:17:42 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id l35so2372019pje.3
 for <openbmc@lists.ozlabs.org>; Wed, 25 Dec 2019 06:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:subject:message-id:references:from:to:cc:mime-version
 :content-transfer-encoding;
 bh=KbIcsXbzKe9rA6dra6u7/U6WH8/xR+7bJXvAuELYB5Y=;
 b=e8AEmKIcPa82t46LKuX4M5+KDc2dWqriBSOYJfw0hBiGHnAU7iH0/QtXICRAxLIuKK
 OuYmZgk5Df3EpbEDK2imjfTxQ/oS2st3Q91TXTBaNZ67vJozDI7p5+KYhtNxdJDq2Lrf
 NfAaK4WDr1N5SdOvpkZNdMMZQ9dyX4yzg0u9rM4bAivh8p5hQG+tw766CtafU1Kn+Nat
 2uBx44Uok8MGrO4PtdUlSSjAh0XIUB4joEZLTEKqICbx+O7ng2pNSs8kk1mOJBtCa2+Z
 /mkuumWBZ8S7c2zGL6HGto7+x0bbAHW8MjvHy1Du2maR//f0ioN4VynVcb7hcfYaSw7n
 0Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:message-id:references:from:to:cc
 :mime-version:content-transfer-encoding;
 bh=KbIcsXbzKe9rA6dra6u7/U6WH8/xR+7bJXvAuELYB5Y=;
 b=b0RvTHKQldDlo6Z1Jpz0dtpgKqJW28Mjvxr4DA8KeGmSiQpg5ppRZeo/uCNIsiB6Ro
 mYuZTTWCZsG5W5xVWpNwUnG7QeT/dhHQl74z5+b1+azffT2uo0tcxdblPD6cVlJnKKcJ
 jchybNLUhNHPC1FRVJcOx/DishRoYA7DOR51AhPALpaBupxcHw7UJlrBKI1MQstZONy4
 Lb14tIx0evnrZfRdxHpu+tCfN2CvkFIGIig6ciWuF0PjoSJlvfLjje69Fjwp8kxmjscH
 1DVpFRMJ6cDeLf8sQ+sQ7CpfAYolSAxgeC76o+FsymAVy4RqFc3tFY9iXT5P0R2tVEQ9
 G7DA==
X-Gm-Message-State: APjAAAVv7nYgKqFCqyJDBTEf715C4n3k7fF3zOwz25gdiOr0Qc1ja5Uk
 CIpJds4lTCSAsa+y7Ch3ZgKtAeR2
X-Google-Smtp-Source: APXvYqy9Zagze+CEsmevYY3msCRW0ZOlxPGWITxftaS7uNFC4gbKTePrYLu7zpHjsHsurnudr+ZNyw==
X-Received: by 2002:a17:90a:e2d4:: with SMTP id
 fr20mr13549313pjb.85.1577283458828; 
 Wed, 25 Dec 2019 06:17:38 -0800 (PST)
Received: from ?IPv6:2001:b400:e200:9cde:e910:940e:33a5:709f?
 (2001-b400-e200-9cde-e910-940e-33a5-709f.emome-ip6.hinet.net.
 [2001:b400:e200:9cde:e910:940e:33a5:709f])
 by smtp.gmail.com with ESMTPSA id l22sm7422740pjc.0.2019.12.25.06.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Dec 2019 06:17:38 -0800 (PST)
Date: Wed, 25 Dec 2019 22:17:34 +0800
Subject: =?UTF-8?Q?=E5=9B=9E=E8=A6=86=EF=BC=9ASupporting_eeproms_fr?=
 =?UTF-8?Q?om_device-tree_in_FruDevice?=
X-Priority: 3
Message-ID: <srgzew-l1kf9xeycd1u52ins3-kstgub-1ezq95xaayhhhnixw7-nz4siqtzqfa6-rfy74s-3qjvd4-pigqjd-jkmigm-p9ccbr-au3vpelslh00-gepbzk-m1b15ij7i8q5-91wc16-si38lh7ig7w810h79q.1577283454646@email.android.com>
References: <CAO=notzvf3R-fQVEqOjV=W0_P27FgmV4zCWbpkSV3pw0-h9=Kw@mail.gmail.com>
 <73945f1c-3652-c75c-bc0a-cab9a58515b5@linux.intel.com>
From: =?UTF-8?B?4oCq4oCq4oCq4oCqSmVmZiBDaGFu4oCs4oCs4oCs4oCs?=
 <ckimchan17@gmail.com>
To: James Feist <james.feist@linux.intel.com>, Patrick Venture
 <venture@google.com>
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PGRpdiBkaXI9ImF1dG8iPkhpIEphbWVzLDxkaXY+SSBoYXZlIGVlcHJvbSBvbiBib2FyZCwgaG93
IGNhbiBJIGVuYWJsZSB0aGUgaTJjIGJ1cyBkcml2ZXIgdG8gYWNjZXNzIGl0PyByaWdodCBub3cg
SSBjYW4gZmluZCB0aGUgZGV2IHVuZGVyIC9zeXMvYnVzL2kyYy4uLiwgY291bGQgeW91IGd1aWRl
IG1lIGhvdyB0byBzeW5jIEZSVSBkYXRhIGludG8gZWVwcm9tPzwvZGl2PjxkaXY+SWYgSSB3YW50
IHRvIHVzZSBpMmMgcmF3IGFjY2VzcywgaG93IHRvIGRlZmluZSB0aGUgaTJjIGJ1cyBkcml2ZXI/
PC9kaXY+PGRpdj50aGFua3MgYSBsb3QgaW4gYWR2YW5jZSBmb3IgeW91ciBoZWxwPC9kaXY+PGRp
dj48YnI+SmVmZjwvZGl2PjwvZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNSI+PGJyPjxi
cj4tLS0tLS0tLSDljp/lp4vpg7Xku7YgLS0tLS0tLS08YnI+5a+E5Lu26ICF77yaIEphbWVzIEZl
aXN0ICZsdDtqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20mZ3Q7PGJyPuaXpeacn++8miAyMDE5
5bm0OOaciDfml6Ug6YCx5LiJIDAxOjE1PGJyPuaUtuS7tuS6uu+8miBQYXRyaWNrIFZlbnR1cmUg
Jmx0O3ZlbnR1cmVAZ29vZ2xlLmNvbSZndDs8YnI+5Ymv5pys77yaIE9wZW5CTUMgTWFpbGxpc3Qg
Jmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+5Li75peo77yaIFJlOiBTdXBwb3J0
aW5nIGVlcHJvbXMgZnJvbSBkZXZpY2UtdHJlZSBpbiBGcnVEZXZpY2U8YnI+PGJsb2NrcXVvdGU+
T24gOC81LzE5IDU6MzEgUE0sIFBhdHJpY2sgVmVudHVyZSB3cm90ZTo8YnI+Jmd0OyBJJ20gbmVh
cmx5IGRvbmUgYWRhcHRpbmcgRnJ1RGV2aWNlIHRvIGhhbmRsZSBGUlVzIHRoYXQgaGF2ZSBkcml2
ZXJzPGJyPiZndDsgcmVhZHksIGFuZCByYXcgaTJjIEZSVXMuJm5ic3A7IEJlZm9yZSBJIHB1c2gg
dGhlIGNvZGUgZm9yIHJldmlldywgSSB3YW50ZWQ8YnI+Jmd0OyB0byBnZXQgZWFybHkgZmVlZGJh
Y2sgb24gdGhlIGRlc2lnbiBjaGFuZ2UuJm5ic3A7IEkgd2FudGVkIHRvIGtlZXAgaXQgc21hbGw8
YnI+Jmd0OyBhbmQgc3VyZ2ljYWwuPGJyPiZndDsgPGJyPiZndDsgQmFzaWNhbGx5LCBmb3IgZWFj
aCBidXMsIGJlZm9yZSBpdCBzY2FucyBmb3IgRlJVcyByYXcsIGl0IHNlYXJjaGVzIGZvcjxicj4m
Z3Q7IGVlcHJvbSBmaWxlcyBmb3IgdGhhdCBidXMuJm5ic3A7IEFuZCB2YWxpZGF0ZXMsIGFuZCBh
ZGRzIHRob3NlIGRldmljZXMuPGJyPiZndDsgVGhvc2UgYWRkcmVzc2VzIGdvIGludG8gYSBza2lw
IGxpc3QsIGFuZCBhbm90aGVyIGxpc3QgKHVzZWQgZWxzZXdoZXJlPGJyPiZndDsgZm9yIHdyaXRl
cykuJm5ic3A7IFRoZSBub3JtYWwgZ2V0IGZydXMgY29kZSBpcyB0aGVuIHJ1biBidXQgaXQnbGwg
c2tpcCB0aGU8YnI+Jmd0OyBhZGRyZXNzZXMgYWxyZWFkeSBoYW5kbGVkLiZuYnNwOyBFbHNld2hl
cmUsIHRoZSBjb2RlIHRoYXQgaGFuZGxlcyB3cml0ZXMgdG88YnI+Jmd0OyB0aGUgRlJVcyB3aWxs
IGNoZWNrIHRvIHNlZSBpZiB0aGUgYnVzL2FkZHJlc3MgaXMgaW4gdGhlIGxpc3Qgb2Y8YnI+Jmd0
OyAiZHJpdmVyIGhhbmRsZWQiIG9uZXMsIGFuZCBpZiBzbyBpdCdsbCBjYWxsIHRvIHdyaXRlIHZp
YSB0aGUgZWVwcm9tPGJyPiZndDsgZmlsZSBpbnN0ZWFkIG9mIHRoZSByYXcgaTJjIGNvbW1hbmRz
Ljxicj4mZ3Q7IDxicj4mZ3Q7IEJhc2ljYWxseSwgdGhlIG5ldyBjb2RlIHdvdWxkbid0IGludGVy
ZmVyZSB3aXRoIG5vcm1hbCBvcGVyYXRpb25zLCBidXQ8YnI+Jmd0OyBqdXN0IGV4dGVuZCBpdCB0
byBsZXZlcmFnZSBhIGRyaXZlciB3aGVuIGl0J3MgYXZhaWxhYmxlLjxicj48YnI+U291bmRzIGdy
ZWF0IHRvIG1lLjxicj48YnI+LUphbWVzPGJyPjxicj48YnI+Jmd0OyA8YnI+Jmd0OyBQYXRyaWNr
PGJyPiZndDsgPGJyPjwvYmxvY2txdW90ZT48L2Rpdj4=

