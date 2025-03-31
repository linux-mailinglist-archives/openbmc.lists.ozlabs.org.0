Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC9A77490
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 08:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRdV66N3gz3c7M
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 17:33:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743489178;
	cv=none; b=X92wxL7YOhuQpgqbNciYD7JvdAE/kVWKpi+bE8NVWOf28umErgB96n2hdWNzMwqZNwA5TctGtbXvNQKFvjX4wBRXpKdoi7zFqVYCf8Te+FT/XVhF07aYZvO+jpQ7g5LMFr9vZX0PIDcgApMsqPRwSCOxBGogxHIe0CqElvykRSPZXPujWX6pXA3ayXKzTjeaWVbt/4EA0j9AMv4SvlxHFzcdk472sflptNCIskeTJUQHdYcJ65e/k6nvzcCkmeHk+RCQzf2wYlPWl7YhevRU4u9gfSfa0E3CmoM4U2GEkLGUugDHOZ96UWqgcG2AT8cwQ2HN/zV+Gk7YPPHCu7l/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743489178; c=relaxed/relaxed;
	bh=4+FGpoYQk2Qd9iAIrupWQUsJj1Vu/SqfUv7Yxg38Ars=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=Od9HNvp2DBeA4AiiuAjb4iI+6zj5XvsOEUu222EBXl4tdwDNpfJyIFcALy8BgXVtVy0fgTbkR9WqBUHa6MIDTu3haCIiy2iDRFor6JoaF+blhkueiaS/PikP3FCFTFiEMfD0eCkD3V+ZBPkhHapGxpydWln22A6xVl3HMlar3KuA8bHOXWnpSC47dPLsgQB3AiO5SUvlw3eJiKel8i9EjIymJZthVXPCQvf9QMeVg3pk014EajnbqwZ6uDBoNhyWmg943Q1GbEEPpYsW1u8ucxOzXBsg/9FTqq/Gfzt16Kr1HLKnyBqgkcGo2wr8CxYNJZ9lqCIA4TUA37dI51ifsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=rTepLyXp; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=rTepLyXp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 38630 seconds by postgrey-1.37 at boromir; Tue, 01 Apr 2025 17:32:56 AEDT
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRdV01tsqz2yRx
	for <openbmc@lists.ozlabs.org>; Tue,  1 Apr 2025 17:32:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Type:Cc:Subject:From:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=4+FGpoYQk2Qd9iAIrupWQUsJj1Vu/SqfUv7Yxg38Ars=; b=rT
	epLyXpGi4tHBxVUXctmMw63Kom/jYOAB8Nccg23oM/4rNfgkR5ZKUiQAJHg3RCmnT8Q2nPsfHfxsE
	NgGkaNWsZ3r3OmZLR1o6y+NkCL4/oluRh3mUPL48ktFDnS95CY0WVP8BktsRvglHmYPDLGF0V2dos
	Ogz4CSkv/s+AwT0RZjz+bs6h93Jx/85XyrQ6FHdaVeaTnLquBZgsUCAFbo/J24IDd6029L/GcEZqn
	mcLTuHstc6a7+V2yrodGrfk8l75LRXwbmurOTdRU40rXFZbIJ+tpHvq7uCZpePfDCDfANrDh5uoW3
	ix2Ed5OxHjIPUPsRD56awJ21+fPxLhFw==;
Received: from [188.40.24.77] (helo=[10.10.220.249])
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tzL7x-004zS4-4S; Mon, 31 Mar 2025 21:48:57 +0200
Message-ID: <2e72bbbe-ada3-446e-af85-811c7ae91998@hetzner.com>
Date: Mon, 31 Mar 2025 21:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: openbmc@lists.ozlabs.org
From: Tan Siewert <tan.siewert@hetzner.com>
Subject: What's the state of u-boot v2023.10 for ASPEED SoCs?
Autocrypt: addr=tan.siewert@hetzner.com; keydata=
 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
Organization: Hetzner Cloud GmbH
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0B05cQoJ0epEvt0w5mnM1dEB"
X-Authenticated-Sender: tom.siewert@hetzner.com
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: ryan_chen@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0B05cQoJ0epEvt0w5mnM1dEB
Content-Type: multipart/mixed; boundary="------------IGWsCqp0j29jbwyYkjsedJEi";
 protected-headers="v1"
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org
Cc: ryan_chen@aspeedtech.com
Message-ID: <2e72bbbe-ada3-446e-af85-811c7ae91998@hetzner.com>
Subject: What's the state of u-boot v2023.10 for ASPEED SoCs?

--------------IGWsCqp0j29jbwyYkjsedJEi
Content-Type: multipart/mixed; boundary="------------4qk3lJ6RrOikm006gd3ARmNz"

--------------4qk3lJ6RrOikm006gd3ARmNz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

V2UndmUgYmVlbiB3b3JraW5nIG9uIGJyaW5naW5nIHNvbWUgb2Ygb3VyIHN5c3RlbXMgdG8g
T3BlbkJNQywgYnV0IHRoZSANCk1BQyBhZGRyZXNzIGlzIHN0b3JlZCBpbiBhbiBFRVBST00g
cmF0aGVyIHRoYW4gYmVpbmcgYnJhbmRlZCBzb21ld2hlcmUgZWxzZS4NCkluIExpbnV4LCB3
ZSdyZSB1c2luZyBgbnZtZW0tY2VsbHNgIHRvIHJlZmVyZW5jZSB0aGUgRUVQUk9NIGFuZCB0
aGUgDQpvZmZzZXQgZm9yIHRoZSBgbWFjLWFkZHJlc3NgIGNlbGwgdmlhIHRoZSBkZXZpY2Ug
dHJlZS4NClVuZm9ydHVuYXRlbHksIHRoZSBudm1lbSBBUEkgaW4gVS1Cb290IHdhcyBpbnRy
b2R1Y2VkIGluIHYyMDIyLjEwLCBhbmQgDQp3ZSBhcmUgc3RpbGwgb24gdjIwMTkuMDQuDQoN
ClRoZSBjb21taXQgY2hhaW4gcmVxdWlyZWQgdG8gYmFja3BvcnQgdGhpcyBmZWF0dXJlIGFw
cGVhcnMgdG8gYmUgcXVpdGUgDQpiaWcsIGFuZCB0byBiZSBob25lc3QsIEknbSBub3Qgc3Vy
ZSBpZiBpdCBtYWtlcyBzZW5zZSB0byBiYWNrcG9ydCBzdWNoIA0Kbm9uLXRyaXZpYWwgY2hh
bmdlcyB0aGF0IGRvbuKAmXQgZml4IGV4aXN0aW5nIGlzc3VlcyBidXQgcmF0aGVyIGludHJv
ZHVjZSANCm5ldyBmdW5jdGlvbmFsaXR5Lg0KDQpTbyBteSBxdWVzdGlvbiBpczogd2hhdOKA
mXMgdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhlIHYyMDIzLjEwIGJyYW5jaD8gSXMgDQppdCBz
dGlsbCBhIHdvcmsgaW4gcHJvZ3Jlc3MsIG9yIGlzIGl0IGluIGEgc3RhdGUgd2hlcmUgaXQg
Y291bGQgYmUgDQp0ZXN0ZWQgb24gbm9uLUFTVDI3MDAgU29DcyBhbmQgcG9zc2libHkgc3Vi
bWl0dGVkIHRvIG9wZW5ibWMvdS1ib290Pw0KDQoJVGFuDQo=
--------------4qk3lJ6RrOikm006gd3ARmNz
Content-Type: application/pgp-keys; name="OpenPGP_0x3B1DDD3AD8D9C963.asc"
Content-Disposition: attachment; filename="OpenPGP_0x3B1DDD3AD8D9C963.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBF1ERgEBEADc7tXD5xuWTwVptgFJ0y/aPLbJkw4tkpW5MHkM0JIKSlaE/uJX
MaUMX8jGSzKpN7WIXzn4nObbEDD4AEJQjvL4otvmG9GOeBlYUBSisse1zyTd/cYs
tkA3iF8qX+eZrRwieViUJ14dxoOvj8OMpzA5bFlzFbaKyS1q8b0tbJF/wVZEogdc
Id4456N3RvDxwxtEpP9Y+iMaLZSoDI4BgVCgPtmwZkdYwwD+Ku1LleTINVNNBfAg
edsUNqJDCiwbDgaaoVNAdCZwSmn7uVduA9v1LHXNucHiSyLllwZ4w2foaLNFnZbg
pn4h+w3c7L9Gc4MkShKWn6CcaMvZkiuyCUEeGvD+BBtr6n7oSUEz7l66Ni7JK/he
eClAqpa7p9az0EC6joJImcj99KXs8V0W6HpFlCiyFgnck9iqGLZEDy/G9otVwntl
vj/lrfucu3Fi6ycEkveNddBnixd+urL3yyEVg0nZpLwRpfmkyY829zr92Y4ftvUG
6MKuoswk/LnwhLhNrMBLy05SdeZ9ZVTY5seVoGd5T08osk4CS1QQI9Wdk+VFbITp
FpReSXbZvJV4Gi28O+ZndHHiuLUBTlLGROi/pmUl1frbojgTYQpf+Z8+ZuirFm4b
Wz2EsrO7T35HkPRKakwahUq2m5Z/+s5LT9gBBgUteHsmlK7C2OcO01f+0wARAQAB
zSVUb20gU2lld2VydCA8dG9tLnNpZXdlcnRAaGV0em5lci5jb20+wsGUBBMBCAA+
FiEEGogUkqo1678CFZJAOx3dOtjZyWMFAl1ERgECGyMFCQlmAYAFCwkIBwIGFQoJ
CAsCBBYCAwECHgECF4AACgkQOx3dOtjZyWPZ0xAAg8K8Btcq3ijNY8IygFHWVaer
yHBxXd6eXWGRI+az9n40acRUkL4ej4AVqDmVsNr6Z9zTpfpO9mRxvcNb35PIs+8o
JpFolL8RY5/C0nVeWLnTiuWpTpTHYTuMzp8fMDMteOS6ew3Aqan316Bere7b6DDk
qLkYnzbXjy9CK+4OlDBZ31mI4CZHR/7vHkev5TCIBiFcBYrp7iLANBATAbjbNgYU
PlA5ymtMErP1igfbLS7nIKLyVxv0YwnuLnhyWpzJ4/RJD2yvSDiAxf6zyXbtVxst
ArZCRl/fL9ubFzZxt+Qubk/+a835m8oiatSaqrcEha0q4MTK57Z4+534FC2lzO6Z
LiOMHa8MRHPfwp95PJ3BKdhRExS5yO7tDktb4dY9eP0CQIzUnOFBrEWIo+yjWeQs
zzygNK+dAltq4StcaUuPmn8d4PSxjonMhWr644bjxnZ4CMTiUpvRaV8pXa+McBlN
WwRY2Hqm2jNkj9in4uoLKc+4AlXprFsQZIoHM7hcjoxre9HH39UdRwV7rYpoJNUA
ddlBebLlSgG3tHyZDgPtTGuN9OAFjJ6s5jauS1HKtSwzk6duNdBX53ERbdsAiesl
XyhXeIwvNRgZ7v/lfg3Gpezk2pemUBIrhbrn/1hXTNd9azM0F8zjlETgcgsrk5N6
nTo9PElLvj/4I6CorIPCwZQEEwEKAD4CGyMFCwkIBwIGFQoJCAsCBBYCAwECHgEC
F4AWIQQaiBSSqjXrvwIVkkA7Hd062NnJYwUCZk70+AUJEnCwdwAKCRA7Hd062NnJ
YzEiD/9mPwsLAlS9ibyHlkbN66nf6AknIwc+nfMluHnLJ6+iVY3BIMz4LlDnMUTh
WcaOt+U8QGcTSJ0GR5D6HwNdvKhwxQ+Cwo0AuvRIYOXc2j6taXcS/MwQy3bI4bp5
xX3g7SnXZdF/k+wCF3xCbQ5vdROFklJBr0oT3h6JjxiHttcB88RVC3BsI9t8HYqj
RR4fVrjaLZLusnisBdkaBIyFHM41NAqJXrR3u/UiG+wX5WHzsyh1tdpdAZCwiNh/
lXdnFJsBdcYcdI5iAzO7W5ic9hm0du4Pela08xYbKFTCgBTe2wMc18TXTZHQWKV7
yfIY79Clx0IImHDIHOlP2+2E3atuv8u9g1Cdegzb5Jva9V3P58TIECmkC+9HJkne
+M+Z/R20esJoENKF0AFYTF+0ys27aziMzoFB2Loz3yS0MH1gWCUcC5Ae3wQXiP+z
Tesp43QaPvL58/aM1O6iQbrlR/cnglFcjiBGqUmj6N84TFCPCz4P5rMAFeppweds
ZqUqMeCnoTQZdPgg1Qd7zxDl1ug32toKUlaahwXs6l1nWtZR4E+jIvwPK9s8x5cM
sBQruS1AJxx0RqpVLCFkIhBMbI9IslTTMLB8GWNKfYDyJT8NYA2KdwkdndiYURz5
W0fxKA1N4TmchIhT3jPYn+uenP5FZFm6LR5Ov18MN3GD+jG6mM0lVGFuIFNpZXdl
cnQgPHRhbi5zaWV3ZXJ0QGhldHpuZXIuY29tPsLBkgQTAQoAPBYhBBqIFJKqNeu/
AhWSQDsd3TrY2cljBQJnRzmCAhsjBQkScLB3BAsJCAcEFQoJCAUWAgMBAAIeBQIX
gAAKCRA7Hd062NnJY5B4EADAABjK7ByW32pImjriWs7/rwgS7sDhtmmpPbxJb1de
UNTML5z0Vbn0iXewRVySe2slI8EiHtl0ng5H5zdlCDpRuVTBMJUdrF3gw49iVtHN
AVGUmrJacDVKl1duNLhLIqzOwzP+dW4q5E9w1Fo+qlb59hj2R07GnVnDcPLvZgRS
5x2/OV9bCCcux5tkPh+L1JrbRU5ykum41iIoW2cskMoUO06VhT3/+nTGcquHJzDK
UcNei6mvTdxeFX8M4LsZqYqjSYKWc61xNZfy2QY6Xrft/raVNeCPtDMRSBBkC61H
rfBjbp7AmAlSbmri6tBqP+djInPIzvJI7yxBb5NHG5bwPNXmJK3T6/cqsdpZP0s/
zochgqpeZdt9p6Nx5pLn1psypKqPSkDgQREVZSDbdwx2LdXhYMN+Kr3GMPKAQq+O
yAElJih29NV2J9ZPz8dq5Gvg3Ws+1fhDl3nM9X6KxZDJVeLL8JI/hlajDa/DTVkG
BKnMy5Xyr/gVTFDzj8oP9U+n9kPDQ/DHb2YJv6qsP3M9brAkorh4FPiLPrvtDPDJ
qnM3STG0ejzA8JyU42UqERHVxo3aE0XIhp9kbzTS4CC29ca1K62VbQjoPVJCYjAg
qZvD/v51AwK98TDl+VhG7TqDezGCdYD3G6DrVHv73M//nX5g91C/rDDLzfo9R4DS
2c7BTQRdREYBARAAn75fnQOcZaCH4JH4TigEhSG1yeoR1juWM0gTGQHbjyuVvHUF
estXIP3+q3qAx8M6m0nbfLxWMaEGQPl83xVeLvtQT0U4A4jhquvLQaS2L5KvnSC8
Oqd4SsPkWlFw63LNbAcgsTp1woqFeXV06yKmNDB3Wg/GMrjzGWTMMsoaCOmH+nnM
oXYEPSyldgSTUB1sK4ztU8nJZQUB7+EsMadfiIdZ7+nxLXMXi+rHXOkWDzAmkIDK
Uv2JEnwrTHcgs/ax8ZOPozOlaVGjtgAYEf912RkbrtF/YJOnG5xEBl+dqYBWfcQM
t1D6a1PXm6AazWG+BWbKXwA0SLGPAIYvhsvgqZZ8ZjRSjs1r8MEsQUKgiMbvss0G
dujYDVHu73j8ZUNgvcpDE1bJfjyjO+Dc7eEkvjDONPuh5AQOO8zf2YOCEhg87j1j
ZyE+yKEXlVzdTxFE7dVR1VK180HcNVZYYkesXY2X9jgknvGeeHAxo0oWkng2D0wH
7EtBmXBiIGrBNmJCk+tdVohsqA4xhxZLG8d0D5Lq9Bgz9tv5Y2DK7fBvrHlawLiT
feXHD3eXRTIDQedY0Hp75F8Ma0x65XSNuTeupNXSAEIFCqS+9asmZAmv6YFwDHbH
zl92ake9voCmfUughB38sN8qMWHI5sgE1dVYef07g9waZXGwHbcmRLRmntkAEQEA
AcLBfAQYAQgAJhYhBBqIFJKqNeu/AhWSQDsd3TrY2cljBQJdREYBAhsMBQkJZgGA
AAoJEDsd3TrY2cljpQMP/3U2EXO5Wpg8HET2URH0TeSmkDgN8bDkCQezF2Xa7VyR
+DlQZLeG//pnTFuUgNTA/LJChghLeV79G9LwFkhxp47NTv0d33bTxiJzdgrL/alt
sKWsf9AWkDk1wEZNpHH2AA2XvLJKbjA/sZUwTXfWQLoRpTzxMQJyEAWHcvrnxt6n
qtmKJdT3UqwxTy9TDK/5wrgsnLT/FPPvKHvnKDNhrNx9YNOrpwD+NIZ3rrko3t6L
u4n7C6nLH8NB39BxfRuP1Twk/uUEyTI6RVmNG9zkmFzIFd8v20gt1bC2oktZaTkE
bTNPKWgL/OvMw1QyDkE0BYI4Bs/DTdm785lnwG+JFv8LfhSue3XVX3vErRPMtRhW
Bb4+Rip178Sj2uvNmIpL56ivZQ4TSWlubKaPj8Tm2ASKiyTGFAkoiGyPX172cBw7
05fFdbRpkJSIdIY73ahmwR7eiEvAj7Hv7jnt0oeXPxeYXT1PO3HrApoTL4ga5nWC
PjbTILbdTnsneWbIB6KLKYX+44F9M8hFdE4jfzV6CYDa4mG6N1YkH+bf6rLApdur
UgFRSQGSFbGK8k94k7U/urlxeA6bkv8wD8/9nMZQbdeMDhDa4shNTzPrQBF7QMo1
eQv1e0VnBcvqvPkaPqpRunHcPkaDYrQ1GPJI8iZd9sxlu5l5TnMAq5CxRgNFblBQ
wsF8BBgBCgAmAhsMFiEEGogUkqo1678CFZJAOx3dOtjZyWMFAmZO9N4FCRJwsF0A
CgkQOx3dOtjZyWNVcRAAxKiyzZvaJBrXyq388aJAmH2hSFWoiADC59TGz+B8vlwy
m/j9Niys/Db04HwpJJNTlUmshSb/n9YzqEV9LqrscEsNkC4zjmcwldD1q0bHMpWD
kBQK5wvmwrbhWT9J9UwWuCUKaVf3ZojekAnr4HE86spx0FKMblMYsJBcqVIsGUl5
y5IvhmYRzs0k7fNY87nOFM/bCpVjJQ+51UrDXfSd3VFU2J0/0emXRZOoOIHIkD2Y
DBfWn5q3DcqVt1kiyIgwvTIoFiTrLqB7XPup/vJzjXxDrBEnfIgmZU/1Ow2tcRDh
Sgn+OO9L0m/tG0uIzWKFNgG+5ukO6IDoXJimAgdxQZhUV8FqFl0a21yLpFOtiO5X
nRhidNRWYfmT4OWLsVHUr75RpFF+JwTfUaFP4gyY1KvevkFdsez+KfBlPRgOEDQr
cs8RL+t9q8s6K0jT9s87ks9yk31VHuOeoog8DItEnvS6XmVe1FZ4s5GpFHPzJ0/i
Sdki1WRi70DXwFKfzMhhkmRF1aqiX+QN2lwVT7pA1tcA1HxnEk8ByO+44Wchinun
ucreL+H6kFndi1eSfeCWfee0U12RoM9euElYFV2T+uT1GSgz6q6rftCZd+8LNrQb
YaNMhWLU5TiGoJ3lsEIe2nV0Boqe7d7Q62ZiYkwnw+fUrdvDd3b4k5HqamQjY7s=3D
=3DMZBP
-----END PGP PUBLIC KEY BLOCK-----

--------------4qk3lJ6RrOikm006gd3ARmNz--

--------------IGWsCqp0j29jbwyYkjsedJEi--

--------------0B05cQoJ0epEvt0w5mnM1dEB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEGogUkqo1678CFZJAOx3dOtjZyWMFAmfq8aUFAwAAAAAACgkQOx3dOtjZyWN+
sQ/8Cx+ZZzeuoMUzkV6Jg9w1CWLkJe9rcNMRpvSIv9JdksU7ORChaUiRwPqAwpMIfJcIHk0C1/V8
bKqu8DiYOOSSQ5mp3QO2GzGl5wRAMcOcgGthbk6EBd+D6S4BOMAOsNz1Z4KGHgNZmtssMP0ElhER
tEp7Yq39l9lRXdS2IXj+5DXjC/AVFNp+pnS8GZefeJMsdnVLqxh/HMmY05YUZ6R7oviNLFmRCwQQ
2IdyTwVujdZk4gLvY0ef0PZaJ0SIXJe/ob9io/qoILg+MgHY7GrXYP1aeYKT4NDSFPiJ8t/JZph7
HgziDqySb4L/jaEpnEvTfJWj7f/pQywSarIhjrkcykQ8rITBDs9ELaxW8sVsWewgXP/S4U/ru06S
+t+jK/8w2t3DojMOztk4+tUpVCDCqmwGxT9lVauCWDvZ2WtTssAooG0n7nq1S/QH3AuZ9ErU/Y2G
ppVI6RxZIPCtmmkIUKbnMH6Bp7PfSWlDx4XxoOH+Ba7JkLCgJjRVNbS7p3je49CRU6cxEHcFg8FN
aQ3/yqm+LW0QC7Bl8PsXd4rd/DKUhak3ciYDgSTQb+uhPxCCagKfRdX/zb0hhsQKtxb7KGIXYuyp
t6YkBOfaHbJMsGcBpN+Xnma9u0+ZrRz8RLtltGEtn/BVT+RWBWWUSUXNU68CoauN4JpUiLoj/2EP
eSc=
=PqdN
-----END PGP SIGNATURE-----

--------------0B05cQoJ0epEvt0w5mnM1dEB--
