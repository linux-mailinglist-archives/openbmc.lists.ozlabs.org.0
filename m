Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DB0A3F50E
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 14:08:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yzr6S0DXHz3cVJ
	for <lists+openbmc@lfdr.de>; Sat, 22 Feb 2025 00:08:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740143308;
	cv=none; b=B9XNq8ggOZ7/ICfHarbzZzX6k9ujFq+NJQy+jean7N07OAAraYtORFWy3URTKMT0laxus74WdAi/Mwee6uhEB2upPWpsJp7vVnWhifGjJn2ZOWytO3xZ2yGe5GlKNBe4A7Tsf73ZM19fgsdxHrnbcDBCHuNAA7dNZKgt9RNp5KEzH6BezNxZ2QTz8E7IsNSJhFOgzd6SOxZsIL8oERxk+T6WJwQTVFnlsOIxbgqL5CjWR3y8k/xfH7ReX0G4PddHfiWs4obC+U+pCaWJP/p/Kbt8JeRnxF9hrtIDrjQNhmfowtuy8BK/SJ7BliUdaOpVHXE2cCDSHacLW8+OWJmYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740143308; c=relaxed/relaxed;
	bh=85ZqJ2WnsK+xsV2MUlzgduJL4PyG/D51U/cS63JS8II=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=IXKmlDHwm3/5+ac51ZEKeQfw35eJDkvHBFtNW4N9w4dtbDhPtXNAU8q9B4cEdphMKG/NHD+vrcCkj6yBWBqn6w5WuRKFRg4PiMRf4mmWdfDlyVCrfUSm0BZddDjQxZ6CX2F9Pnlz3rwTuYhVTG4BqXseyDlp4oO7Xw5QrbkDKwYwWp5XK0bWYDHC80YxzQncoVO1s+hEf2EpGvi1+HEdwTVOonBEtxd1DSTt2OkaqSoAjbT4gXM7C41kgs/Wq/AZ9v3+Fy5Kk+UiE7Vfps3LPEtYmI/3yVFQEaNBlWFMqnc7mNhZ+gOnpocUOTyrK5nVea2wF9dmuqCZZ5PFjg6CKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=D/QsSQi0; dkim-atps=neutral; spf=pass (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=D/QsSQi0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 384 seconds by postgrey-1.37 at boromir; Sat, 22 Feb 2025 00:08:25 AEDT
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yzr6K5s6Qz30Kd
	for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2025 00:08:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740143287; x=1740748087; i=markus.elfring@web.de;
	bh=85ZqJ2WnsK+xsV2MUlzgduJL4PyG/D51U/cS63JS8II=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D/QsSQi08JUGSHmE5UoFOQQ720cLOkUU41LOT4vVUVfW6SihsQ1JSWMU4U5jjn2V
	 8MZqkRiKY+bgUeV671VnmDcd90fM7Ri+PIgxPyYxxHiKT26XvuVMzaoQrZsC+H1BW
	 LJ1xf+FKXKgTyXg5G30heAeXDWN1cECHwyvjhm7AMlAjjCgIJHF42UO3mjsmHdbbE
	 A8YzXfCh4+6vfHrZt3IHT5tRM4/EzOEu+hmDhaXgUrHd+2QK3KqzqQA4LK5gknk7b
	 r2e60a5VzxZjllT7kn9H5JYeCkkAog46zZ8ze36CuWfmHTmf8Ukgy9hj4KCJAhVeo
	 ARuyKbZgd5Tl5kuuVg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.4]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjBVv-1t9MYH25ll-00hNJl; Fri, 21
 Feb 2025 14:01:44 +0100
Message-ID: <b8e127d4-0a8b-437f-a856-3f75d4680045@web.de>
Date: Fri, 21 Feb 2025 14:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, linux-media@vger.kernel.org, cocci@inria.fr,
 Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iFsHkTyzJQla9LP+6t/K5VjRFy7phUQNDh4Men40wXmfAgHQZAO
 BAFszW1jSronbk2zcvpuTTav61LBTyccqcQFDQORsyQlfDVVirQI5PnSCEtZeEWRd5xFMMA
 mzxy11KaOa6hDDfV4QWj6lsTIxYtHnDaIFW9MZPJdAb7XriUShYvkx6cMp/Qble1RJqD40N
 UebwF5jr4cGJTiemgi9rA==
UI-OutboundReport: notjunk:1;M01:P0:O9KXyi3GKnE=;mKu0pZznjCCBqR5adRQ4YiEOJVI
 HKx5Db6zEH3LjMEkHyfTkkq84FrJxChQo78XawUNAGusjHvWELCzO1rBHsMECIa4hGdN5Z1Fm
 r0GG46qTXzrffcvbIDR3HicH/ov4eICvnSo6pd+TTHDyP0YBZiNzWhJwutR/46iRtGd4HDiwL
 ze6ydK5qfyFPjVtfuf68q8T6S/K1p+WNPUSL9jsMFNj/zIjnXxOqbBOaZXdMQGNAgbbv9ecNI
 k/Mi9TafmCmQcdt145L4vSLJ8WIZXjnGZ+H4rzoDhRovGvwR+Yid+GvBR9usSu4DHxCPc3oOG
 1TmPmvMpikDoyNJfeT2GYEjcZWk8PtzqESVaBOjL0eTlbZFEMpkKKYB7R0VmRAy6EPfU3vPgJ
 NPKwGZs0UjSshuFC/3q3KYxhcMny6+4WnyuOqGUBWRSBktfL0rDcG5DH1/DaFfT1UworkFEW4
 BjqnDRMvcu2Iy4uTpuFVt4tf/+LAJ4CSBuFSO6+yLIBH27q3eo59qNqo+vkThlDEuz8KoBp7u
 R5GNu4KKrEAx0EoooqJzZgIoFXzr92pG2pDokcQnd5yRjTzcKhv0lwsJyqv3lYrgrDsKk/kcl
 mArNxKy4/0HZzD2uLizXp808wFjsuChcjmwNenqxHdzQp1vivXa3wKqT558NKeQQt4TXdOvdT
 RErZlKCtVQuRFuX+8/6f+zwU+liS7vgg+5w7yNiCRYjW5xSHaSAQm7mzf3UT+LueU5ee+s57L
 Dmtb7AS+vlSK54OsbL4L1VC3eXiq1ob1YVrF3HwnwrCoDHYy8Nnrh/fLTerdjPlTZK6n5ckxu
 8gXyzarnnLCALJy53KsmxYLBNIGZop4/qnY6uajvIUkKah5ajk3w/qkydbmgtC5pP+2qM4Ivl
 QHZ0tmQy347ClHkrcCqfdT3JamX7ZrJ95nNtrz0PymsP4M71QwsJyACMcyx6YTaOWTiKCNdFY
 bdV2oTItq9OOsDfF47khLwicvbHcphkqiuF2X83FlDdc7aBp3QE+rnw8etgcQTVV57awhoGxG
 nujnwAPiHAmHNizOwZe/0p3GvMtft1Xzg+DWo+4tPqqkF3NCuRDIDPeK3l3rOxNdqgcnuCU7F
 HGe0Zyd+2k1myFomd21mkAG2VnVkoVaXoWtyKZpl8m6VQH2CZKnFBiJCJ/HAYvmiGMSMi4mcw
 tFf46x4bG2MQE09we1pgFsb++nfIiGfUHnlf4o6dTsN4zXYxAOjaTbzgM0uxyeGWxK2fy5Fxd
 Y5MQMjjU9WYzbNBTGxeY3qJ/d7mWyzp4t2ZxBeeruzuQ7q7jrmh8tnsu2cDOI4fh3KidVrANz
 PVOpx0zJpt6qEMYcuLG8pw17GXPmXu4lBuy+NjZAzRgHa7112HSPfQ1W1On08v0DKs9BI/syJ
 vu9M71T8SCZp9QfVB6L+AZGuzv285YCCUiapUsDZ5y5H7I8WgIJs8OFa+O6CJbB/u6OoSmWVX
 kgundOA==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, Marvin Lin <milkfafa@gmail.com>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> > Found by cocci:
> > ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; c=
all of_find_device_by_node on line 1667, but without a corresponding objec=
t release within this function.
=E2=80=A6
> This driver uses this construct:
>
>                 struct device *ece_dev __free(put_device) =3D &ece_pdev-=
>dev;
>
> to automatically call put_device. So this patch would 'put' the device t=
wice.
>
> Does cocci understand constructs like this? =E2=80=A6

Not yet directly (for coccicheck scripts).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scr=
ipts/coccinelle/free/put_device.cocci?h=3Dv6.14-rc3

I am unsure under which circumstances support can be added for the detecti=
on
of scope-based resource management also by the means of the semantic patch=
 language.

Regards,
Markus
