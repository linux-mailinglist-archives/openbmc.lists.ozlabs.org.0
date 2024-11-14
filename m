Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9C9C8163
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 04:13:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xplbd0PD9z3bmH
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 14:13:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731554010;
	cv=none; b=LA1S+27FExJ4SrFNnn0Z/kv/FWG4jwMq7CpFIA+Z/E6l5KgB0Jo0aubTmG5Svr9K37secsBfTVSg51VNleGzhgNgTRJ9ouHZCeMCSvHE6jTco9mgt95hWtcKo3ION6AVfWT7xykkKpgaW4K/grlCGozEzuuOT2nYS8NSXNjsTt/RhJFZP5TcYrNb0mPZeiYWtR+yFAR/NTQmGEayt9MTfVhodjEtck4JGNEmHfoudC5L2C3c39BdwETRDk4LMZhCfYQlpozFwPbTJDZ7IrCI7uJASRVhs/WRjOfn/zJETU9NMSuyEpMeb6LvgSvK8xzLfgG4S35XVlcdDc7c5hgv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731554010; c=relaxed/relaxed;
	bh=CnTuDgvlgK9u9BxyMLbf4x+3M9Uar15r1RKsdLSheXE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PIKKeuZMJN8vyA7egi3axxXa21UI+8ZLcFitM0SQFaG6lu2LLpqaa9dUxa/ooISzeDGqcjTgd0uaAxfNu3EzhGWmlaXNuSKKkVE9Cpqzpp4sdUmY/aTRY/Pjo1BMOk1D/vVR5ldht4PGzg6d4AR711989Ox03RNCjZV16I8fD/Gn2s40WhwMYrYnHkhH/RsGsokZ1DpOeCrAwUJ6KXHvoT7Aov/qUzSAIWibzAvqW9KtEWfJox4HI2J+PM5pMDPpf0rzFoxcVzq7QtmuQVXctgzv1RdwCXhHEnRGbWnkuDmtpovl1dzlSjTvT9AyafP2hv9QcjJG+LqgV/TMrLEKTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Dy464IS5; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Dy464IS5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XplbX5tVqz2yMv
	for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 14:13:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731554005;
	bh=CnTuDgvlgK9u9BxyMLbf4x+3M9Uar15r1RKsdLSheXE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Dy464IS5orQOiChM5fIJcm7w2celhG8pS9hFnBk9HFDhDP5Y25yZRgkZZUyoKVGTu
	 YnZWVuhvsbtMcHEHc399b0+VmpOdUDT0sPuEv0/9YiJZ9w4AiHwbYKmfykkFMA/ERR
	 E/HoxMkW34Ad4D8hdVLvKFq03e3tKPN9yhLznuLSNGEHDCWgjafDMrl33Qj7B73wKk
	 uplMlkxHAUGR4xPDZwT0YexK+8k9Qm4cDKuGIvpT+3tolxTLUeRMKKXNf5AtjFZF/7
	 UsJNHC2Mk677szV4+66jWel0Jf8y8mn97w083W5bQwX6N7J/5fy9+Vj2guymR+1n0F
	 hr6eqY//B1Vjw==
Received: from [172.16.160.229] (static-98.141.255.49.in-addr.VOCUS.net.au [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6E8F466745;
	Thu, 14 Nov 2024 11:13:24 +0800 (AWST)
Message-ID: <da9b94909dcda3f0f7e48865e63d118c3be09a8d.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next] mctp i2c: notify user space on TX failure
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Jakub Kicinski <kuba@kernel.org>, Jian Zhang
 <zhangjian.3032@bytedance.com>
Date: Thu, 14 Nov 2024 11:13:33 +0800
In-Reply-To: <20241113190920.0ceaddf2@kernel.org>
References: <20241108094206.2808293-1-zhangjian.3032@bytedance.com>
	 <20241113190920.0ceaddf2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmFrdWIsCgo+ID4gQEAgLTU1MSw2ICs1NTIsMTQgQEAgc3RhdGljIHZvaWQgbWN0cF9pMmNf
eG1pdChzdHJ1Y3QgbWN0cF9pMmNfZGV2ICptaWRldiwgc3RydWN0IHNrX2J1ZmYgKnNrYikKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X3dhcm5fcmF0ZWxpbWl0ZWQoJm1p
ZGV2LT5hZGFwdGVyLT5kZXYsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIl9faTJjX3RyYW5zZmVyIGZh
aWxlZCAlZFxuIiwgcmMpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0
cy0+dHhfZXJyb3JzKys7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c2sgPSBza2ItPnNrOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChzaykg
ewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzay0+
c2tfZXJyID0gLXJjOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAoIXNvY2tfZmxhZyhzaywgU09DS19ERUFEKSkKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNrX2Vycm9y
X3JlcG9ydChzayk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IAo+IG5v
dGlmeWluZyBzb2NrZXQgaW4gdGhlIHhtaXQgaGFuZGxlciBvZiBhIG5ldGRldiBpcyBhIGJpdCBz
dHJhbmdlLAo+IGNvdWxkIHlvdSBkbyBpdCBzb21ld2hlcmUgaGlnaGVyIGluIHRoZSBNQ1RQIHN0
YWNrPwoKU291bmRzIGxpa2UgdGhhdCB3b3VsZCBiZSB1c2VmdWwgaW4gZ2VuZXJhbCBmb3IgTUNU
UCwgYnV0IHdlIGRvbid0IGhhdmUKYSBmYWNpbGl0eSBmb3IgdGhhdCBhdCBwcmVzZW50LiAgQW55
IGV4aXN0aW5nIGltcGxlbWVudGF0aW9uIHlvdSB3b3VsZApzdWdnZXN0IG1vZGVsbGluZyB0aGlz
IG9uPwoKQ2hlZXJzLAoKCkplcmVteQo=

