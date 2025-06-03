Return-Path: <openbmc+bounces-117-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D08ACC53A
	for <lists+openbmc@lfdr.de>; Tue,  3 Jun 2025 13:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBSwC0YRKz2yRn;
	Tue,  3 Jun 2025 21:21:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::929"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748923708;
	cv=none; b=fwPW2sW+L8m9/Nbj/f0F3mph0Ej8N7KA+JUYyWry+4KQc9yNs+Ts/zHwS3NYa0e6IcIYBLIUj94ivzE9joI7ykMc7+NvYUc2NKpUQzrs7EvYCZKtVS3CFVxKQG0oQsiKBDfu9Srg/WZZcw+DxaUlL6syDjn+oUJuUHfOdDk3+rxTZIZYIqw21THWyZIs6Ys5IdHYK1gy6RHlPwhHw1xxCCFzJ4xFH6/K6PHApNuAKUBB2QvqzA8aSzF07y7tBJmsd6Go3qg3Jpf1BR278AX00O9flrR1mUVbdLa3Ayd1z8kpOgbDTMp/fOyM5k72vm3E1eTwMazLk8oevdME/iEFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748923708; c=relaxed/relaxed;
	bh=VFy5yIB373ClFPD599OZbUBftbUG1oI1IT4Qid5bXZU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Kz/MTcCs9H3tM3U8OOq8NqGpnF2nybHgD42/i53F2FWfYYMwe4GZGCPIcoIqL6svgFH7ToQeBgGW6NRgRl87BKG0IAhi9TsjPYe6EKn+GRa4R/gjXgHCypd1TwsWqxncr6mjL+3AW6kUKtpaif09lITTnYHraH2aTRYL2wq17OvS+UAZ+KewaNE6m8XELFycKolhGdxZw8mKa3i/y+UB9gofzatN7dq3JCLX963eNU5xxwlcMQIR3Q+aLiCiYMZbIUcngSPGCbENl3hOYyM3oDb3kDOc6kPUFrTx0xjw6dLOzotfBnQUFP3WyhBcs8R+Xt1EdzkWbumbtZD4/oRPvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QIJ/Szc0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=yang.zhang.wz@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QIJ/Szc0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=yang.zhang.wz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBHJC4CpTz2xDD
	for <openbmc@lists.ozlabs.org>; Tue,  3 Jun 2025 14:08:26 +1000 (AEST)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-87def342791so943616241.1
        for <openbmc@lists.ozlabs.org>; Mon, 02 Jun 2025 21:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748923704; x=1749528504; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VFy5yIB373ClFPD599OZbUBftbUG1oI1IT4Qid5bXZU=;
        b=QIJ/Szc04KyfJDb3NM3ZjlPwi7axIOoO0syaDXRKpm/kC5tQYOJiGQTmt6WQMsJUg7
         79WInOw1/JXZrxwRn1inQPTRvkj81S5lwLeIbsWCv5VRRPXCynd8KoSesi8pmOWQdI7R
         SIR67ULpoYCx6g+xCq0FAOyvqhkuYTIJQ9Tjr1ddaGIERFQtiBvWoQVHWFs9b0OqOq8x
         g6gxfKlKSkJdrRPTjHRbqQw1XNl80TbN7HlXjACyZ6bLbHGMQPoC+DLbBbh2mnsKzv0D
         K1zJxc0DqE0zmhfcl4+EqQuJZbrAZPUL19eksCUdksAduwRWO782iWRarQqfx2+wYDwu
         q/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748923704; x=1749528504;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFy5yIB373ClFPD599OZbUBftbUG1oI1IT4Qid5bXZU=;
        b=uo6GJnejmsdaBL73EdZzG0UJAWuMOnTOSUEQ4k1JhYm0Y0brNuK5/voZyiruWKQ9mG
         1izJGnSBoajz9bOAbAdd4MAX6Re7wOAxmihpc4yrzPSij8XtvA30mZWjo3CfJLe0yDiP
         ea2HVoWFN0SwH2oPQmORcCUSC1ajHZqpH5oBBbJj7ah3GLoqrFy1LysHMkxPpAE5hxJ0
         CiDmTLdZsC+A9+jFxsy/eJFzaGzEId6LPdteH4ONYb6dn14Lxhuo3O6+EK0xKiTzmLpJ
         WsSJ4tb+oqrRfUV1lJGbrozBL1PcuNanJdp0yeJy2OosDti0uQWf7lsTy0WCiuYmHnkG
         LeEA==
X-Gm-Message-State: AOJu0YzYmGNxXPZ0HDaSjsi6GtiBv3L8mGResvk1tEmwVbgwc4inLjt4
	duBbeZUJALf46K5GEOi7b/m8yjekZQwdE9tYXqGT2xA3qCfM2q/EgcZQFDqSJ0WBJ8IqOA1RtAF
	dZt72PeLBorr9H4XrKG0VP6iY73JQsYI8EN4n
X-Gm-Gg: ASbGncvsTI5FXTBOqGuxZuBPgTqsV513oVXVWOu1Q88OIhagWOfm1zmptGf2gmB7BZg
	T3895dOinGhOENVeq7nRYTuT+uRlp6AIxzazGPdl1US0RTloh/zrluXCGxPWV/vxJKtPPF5U0dy
	7YrxRQ95R7LsjLOLIYCTitbjXNovO1YY+9
X-Google-Smtp-Source: AGHT+IH7YV7pX18YsvqyBQzp+bKhYCXHzWyVRy26lWqDfeeST9KcdKXgyNvEN6x/tbbGGtJKjIO/o8c9qCiE/s1OIW0=
X-Received: by 2002:a05:6122:3d01:b0:52a:791f:7e20 with SMTP id
 71dfb90a1353d-53080f76fd9mr14284235e0c.4.1748923703633; Mon, 02 Jun 2025
 21:08:23 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Yang Zhang <yang.zhang.wz@gmail.com>
Date: Tue, 3 Jun 2025 12:08:12 +0800
X-Gm-Features: AX0GCFv1IjJ8feUSPvX_DqVDJtzGJlw2egARr0wcsypcBB4d937oDzH8EgA-N4Q
Message-ID: <CA+3C=r9siAo_CvcZDThLczrY09zFaiPK2O79hF++scA81vGHZw@mail.gmail.com>
Subject: how to wipe /var /etc during upgrading
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000182a2a0636a3085a"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000182a2a0636a3085a
Content-Type: text/plain; charset="UTF-8"

Hi all

I used scp image-bmc to /run/initramfs to upgrade the BMC, but found that
the configurations under /etc still exist after the upgrade. How can I
upgrade /etc together during the process?

-- 
best regards
yang

--000000000000182a2a0636a3085a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all<div><br></div><div>I used scp imag=
e-bmc to /run/initramfs to upgrade the BMC, but found that the configuratio=
ns under /etc still exist after the upgrade. How can I upgrade /etc togethe=
r during the process?</div><div><br>-- <br>best regards<br>yang</div></div>
</div>

--000000000000182a2a0636a3085a--

