Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4232F76E5
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 11:43:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHHpD2876zDsfs
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 21:43:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e;
 helo=mail-ed1-x52e.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=elpnObSR; dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHHn35tt9zDscn
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 21:42:12 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id dj23so6400043edb.13
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 02:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Nr8wwfiK3NC1dK7/ZWkHLRfPzdPBs+uCaQ1gx77hLqk=;
 b=elpnObSRVQlrLYhzTxCGJzspbGdx1bLctOaWP/O95zYQ4w2kgoR4nIsMEbR99FkEmH
 YJkQcrpzPb8rSU3qfZuYiWLeMHHfDDaq3IOteiA/+g1xdseFybWMtmnsvSvqX3HMXqak
 /sfXNSDS0/g3iD5Zew6uMBRNzqKwoaQ0zIKPZDrScQN8BjQKJeDpuQNyuy5LxfmbRib6
 cBOn78svlZSKIejn737As/QHbrpG2Izt3utda4LpJL4+ThqldWeRJ7wOQfiZre+LxbSe
 3WUFE1+XYxpj8qjBzsNfQynNNgLRWDfU3kT01XSS0LGtaRdosauKp4f5rb+pChD2ZQyz
 YDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Nr8wwfiK3NC1dK7/ZWkHLRfPzdPBs+uCaQ1gx77hLqk=;
 b=fMjBkySDvWE/ocbkW2A30XYGgyydJOs5MVFBBm2TEkd4uzeDqeQRKNt08DYfHe9pnN
 NE8ndjKIllBMnnVsTERUqniPToxc8tD64DtxQOfS8jslyfEpn6SIAVJ7Yv+AUL4YP1KU
 mOgs8CjmgD+AFpL25gxSsCeqT6oyp9iY/gxsP9gbSEs3Zi16J5g/jxIWxAXwpHuo5wKg
 vlk+HhwIOhyegNsREnQmtcILWldfy1/3yaQ3b5Tr4RSjHAtk7B7h1OAn6mV5ziRuovP2
 MYbhMCc2UEng5QDs3Bk3wgBI6af8dj/8ayKGNebtfM5W2gtZfX/Nq5yZK+bpQZEA0EhE
 fH2A==
X-Gm-Message-State: AOAM5314IZZzfIBnm8YS5aFdYJirb49JyHjWiH1oGPr6lNQW7Afu3lcN
 bcRywDXY/tecgDrEWLwrVT05cR0c+Umh7Esq/HHoo9kGwTU=
X-Google-Smtp-Source: ABdhPJy5GSYWLEZmbmvB93OJirwxSHrHH9/qJXgM0GOJuSvEDBGgMjn9wLT/2RjTeyPdUqmBlLjHi/LQi+MKOCiggRA=
X-Received: by 2002:a05:6402:1f4:: with SMTP id
 i20mr7247097edy.180.1610707327333; 
 Fri, 15 Jan 2021 02:42:07 -0800 (PST)
MIME-Version: 1.0
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Fri, 15 Jan 2021 16:11:55 +0530
Message-ID: <CABYu0WhdNyNpJ7n1_LAW2eDv5J9uSmSKDQbMHhjLb6N_moB=ig@mail.gmail.com>
Subject: Hot plug support for aspeed-smc driver
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001538a405b8ee063e"
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

--0000000000001538a405b8ee063e
Content-Type: text/plain; charset="UTF-8"

Hi All,

We have a use case for dynamic enabling/disabling access to spi nor flash
using an external mux.
This is mainly for data flash access over spi controller.

Since we use aspeed-smc driver for both fmc and smc, we cannot make it
loadable as of now.
Is there any way to handle this other than writing a new implementation for
spi controller?

Thanks,
Shakeeb

--0000000000001538a405b8ee063e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>We have a use case for dynamic =
enabling/disabling access to spi nor flash using an external mux.</div><div=
>This is mainly for data flash access=C2=A0over spi controller.=C2=A0</div>=
<div><br></div><div>Since we use aspeed-smc driver for both fmc and smc, we=
 cannot make it loadable as of now.</div><div>Is there any way to handle th=
is other than writing a new implementation for spi controller?</div><div><b=
r></div><div>Thanks,</div><div>Shakeeb</div></div>

--0000000000001538a405b8ee063e--
