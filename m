Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 792CB165407
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 02:06:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NGdM2vQXzDqSG
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 12:06:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FASA6Atq; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NGcn4fsqzDqRS
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 12:06:17 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id t6so840196plj.5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 17:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:subject:message-id:references:from:to:cc:mime-version
 :content-transfer-encoding;
 bh=Z2bLuXZyX8EVLOeYbTzoQSpMEBtAX1I3UPoOjLlMcNE=;
 b=FASA6AtqgGlFYew3ppy5s/608WsmrLARlUVyqL1jasVLG1/mpCS6XtISfAJ/I3gnEq
 qbThFXzRfzh+95oeACtGtIG2dY/GclzQw0Y+u2SAsSdZgHIFsqAF6O52wTxgQp4TRC9i
 JgHnuCGh/UjzFuBuelkdklLufNxDJ76NEI/mf/+CTtxMvnZIlDHo2AO+lERHhdvE3Mh+
 uhHaqq+aycSh1pGASxZy4EaDau9RgUoN0lmwQh3CnHp8R8Z8+QU6v+X2WQFrGZqmh7vK
 pdwtahMnoJISbPwaipKVQ1yKiWj3m1IanE3vELO3EuEW5+NEbzqBlYeBZYQIYhfphfdj
 Uaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:message-id:references:from:to:cc
 :mime-version:content-transfer-encoding;
 bh=Z2bLuXZyX8EVLOeYbTzoQSpMEBtAX1I3UPoOjLlMcNE=;
 b=nUJ3nhY3igM+CgXEtnmQdKvr6CzXJrxugUfevDKMC09dNpqYMrLabkBJTrMt9D6G2w
 e1SwildR6IPFV03ZMcIz0iUCiYNI/rXNRG8hE93kOO0ekE2DOveYq2u4HDxWBVtRD7WX
 x9fuZhQUno1pexSUi40uEqFx4Y/E+UV5BqP9YSG6U1Ne8uDeCi62XE75txE7qOc9jCx8
 kL9PjeKkES3fhAJ6LWlP17ig+t/UUyzYSMM+0Q4h3IUL7KSMSiz9bWoyBQz7wSvY6Gjn
 1l6iG+rBwfqSLEJoWKm84Gda5YIv1b60Zz62M3HSa0zO2qSpaNuHTZik1WNvyX27QCm6
 fuyQ==
X-Gm-Message-State: APjAAAWBgTd8irBruyGdt+eWjQ8uqitvZC7vT4ur2WbK/y5YcadrwAzc
 5ZBuket/zNcMXcj8sE9lpJQ=
X-Google-Smtp-Source: APXvYqxgIjkU+7Vls+Ww3OtoqOkFiK4k0sSy8H3PLMGb5j8gtsZXLtmvmAXlJ10iFW7rjMFWuu2DwQ==
X-Received: by 2002:a17:902:bf41:: with SMTP id
 u1mr28098441pls.207.1582160774812; 
 Wed, 19 Feb 2020 17:06:14 -0800 (PST)
Received: from ?IPv6:2001:b400:e28f:c14e:e48d:ed61:f2ff:4ab7?
 (2001-b400-e28f-c14e-e48d-ed61-f2ff-4ab7.emome-ip6.hinet.net.
 [2001:b400:e28f:c14e:e48d:ed61:f2ff:4ab7])
 by smtp.gmail.com with ESMTPSA id d22sm801574pfo.187.2020.02.19.17.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 17:06:13 -0800 (PST)
Date: Thu, 20 Feb 2020 09:06:11 +0800
Subject: =?UTF-8?B?5Zue6KaG77yac2tlbGV0b24=?=
X-Priority: 3
Message-ID: <-sifmi5quxtt6-92q1n5-wyg6ssnts50d-w3mxqcpkbefz-35tf4ixc78y0-97rd5o-shjcwj2at2netjz0rthkxa46-tez059-yjezs9-f6thaysp4k1b6xrwf-6pqhrjbvxja7-b3yx80-86m5ir-5rqmyn.1582160771127@email.android.com>
References: <-3ba5uk-q8utwbge8025-qgehlm-fki8rr7khfu1-p6nczl-6suqdm-6kinuh-56lojropdia6g2uvvm-yjw858-7vs2zw-7n6ouz-c58rf1jalry2-ykhwcn-gv83n533ioofq6fq28-2f5aeoa69232-g6kqx5.1581420554253@email.android.com>
 <2ABDDF61-AF88-4777-9D51-1D5FA65293B6@fuzziesquirrel.com>
From: =?UTF-8?B?4oCq4oCq4oCq4oCqSmVmZiBDaGFu4oCs4oCs4oCs4oCs?=
 <ckimchan17@gmail.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

PGRpdiBkaXI9ImF1dG8iPkhpIEJyYWQsPGRpdj5UaGFua3MgZm9yIHJlcGx5LCBJIGNoZWNrZWQm
bmJzcDsgZ2l0aHViLmNvbS9vcGVuYm1jL3NrZWxldG9uLCBtb3N0IG9mIHRoZW0gcmVsZWFzZWQg
MiB5ZWFycyBhZ28sIGFuZCB0aGUgdGl0bGUgc2FpZCAid2lsbCBiZSByZXBsYWNlZC4uLiIsIGlz
IGl0IHN0aWxsIGdvb2QgdG8gYWRvcHQgaXQ/Jm5ic3A7PGJyPjxicj5KZWZmPC9kaXY+PC9kaXY+
PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41Ij48YnI+PGJyPi0tLS0tLS0tIOWOn+Wni+mDteS7
tiAtLS0tLS0tLTxicj7lr4Tku7bogIXvvJogQnJhZCBCaXNob3AgJmx0O2JyYWRsZXliQGZ1enpp
ZXNxdWlycmVsLmNvbSZndDs8YnI+5pel5pyf77yaIDIwMjDlubQy5pyIMTTml6Ug6YCx5LqUIDAy
OjM5PGJyPuaUtuS7tuS6uu+8miDigKrigKrigKrigKpKZWZmIENoYW7igKzigKzigKzigKwgJmx0
O2NraW1jaGFuMTdAZ21haWwuY29tJmd0Ozxicj7lia/mnKzvvJogT3BlbkJNQyBNYWlsbGlzdCAm
bHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozxicj7kuLvml6jvvJogUmU6IHNrZWxldG9u
PGJyPjxibG9ja3F1b3RlPjxicj48YnI+Jmd0OyBPbiBGZWIgMTEsIDIwMjAsIGF0IDY6MjkgQU0s
IOKAquKAquKAquKAqkplZmYgQ2hhbuKArOKArOKArOKArCAmbHQ7Y2tpbWNoYW4xN0BnbWFpbC5j
b20mZ3Q7IHdyb3RlOjxicj4mZ3Q7IDxicj4mZ3Q7IEhpLDxicj4mZ3Q7IEFzIHRoZSBkZXNjcmlw
dGlvbiBpbiBza2VsZXRvbiBnaXRodWIsIGl0IHdpbGwgYmUgcmVwbGFjZWQgd2l0aCBwcm9wZXIg
aW1wbGVtZW50YXRpb24sIHdoYXQncyB0aGUgdXAgdG8gZGF0ZSBpbXBsZW1lbnRhdGlvbj8gd2hl
cmUgY2FuIEkgZmluZCB0aG9zZSBkb2NzIG9yIHNhbXBsZXM/PGJyPiZndDsgPGJyPiZndDsgSmVm
Zjxicj48YnI+SGkgSmVmZjxicj48YnI+TW9zdCBvZiBza2VsZXRvbiBoYXMgYmVlbiByZXdyaXR0
ZW4uJm5ic3A7IHNrZWxldG9uIGNvdmVycyBhIGxvdCBvZiBCTUMgZnVuY3Rpb25zIC0gd2hpY2gg
b25lIGluIHBhcnRpY3VsYXIgYXJlIHlvdSBpbnRlcmVzdGVkIGluPzxicj48YnI+dGh4IC1icmFk
PC9ibG9ja3F1b3RlPjwvZGl2Pg==

