Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA06F771B
	for <lists+openbmc@lfdr.de>; Thu,  4 May 2023 22:35:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC5Cr1XxFz3cTk
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 06:35:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eLJgfPOL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eLJgfPOL;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC5CH3R2bz3c8F
	for <openbmc@lists.ozlabs.org>; Fri,  5 May 2023 06:34:33 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64115eef620so15210390b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 04 May 2023 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683232470; x=1685824470;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORASDzOJC6cyTDjqC23hsIvpM2ufMHL8cJncTFsbBvs=;
        b=eLJgfPOLDPOles2VYZGZBAIod5bKj+dkzznltWKulKFGw7ixEq0EDIYXPqGub6lr2G
         auAhF3+m2/UjVXpVmannQhOwJ/iY3CeJTlU3wjoW7DrXgxzcgpnyYd9vnktv5Tpl4o73
         HT70JU1/INF/bMv+VkPZQOCFOmUOVxRHE0tKdSW9yxeLryJRkXpdAaAwGJHRkqg9PBWz
         v4Yiy2m8pe6QGF6VaHCXRD+8XvmJ0XgzYoj4TAyLVYGXvmEsLBY+3t6r0aeaBmVzPXSr
         2vILji+QL3+94Y+l31z07FQcGTuQfXMHn+fOb05mX5ND41dalUbd1z6B17x2yt11rqyi
         UOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683232470; x=1685824470;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORASDzOJC6cyTDjqC23hsIvpM2ufMHL8cJncTFsbBvs=;
        b=Cg4mdv7QRvJ3htDZX5C3uO7xmyUvdpU1l29srd8FXrWuwe7hWaIW4EnLIEnAK1BUQF
         NM0KtF3j60N7fZ+oU+JGTKfUyIpG3LBfXLRYAYx6eWJr73//pdcjBi5X8zf4q+ifB3BR
         Gic+4BoUh/ha0x9Hmozw+6lmSypSlvVyldzu7T86xDGt38qgq7pkFo5XjimFj+XaRdXZ
         JJBAgJNDkTtuQmBkz5bLFa+mhNfZI786X2UwLTrjzuiWEfgchR+Lq4oK20G6tIXFrdku
         gAD63dUf9uRjmV3XCJyjH0XRfm6Ts3/XoOWAsol+XFJBilapKJYjobQpCHk+o0yJMRB2
         3fAw==
X-Gm-Message-State: AC+VfDzd8yQJvqkJioKpWMNhiMG1aiYbynhIMRBakNYYGWgCaDX+sg52
	XB8AuYXJ3VjnVZ7v1bZiEdZTdbjwaJo=
X-Google-Smtp-Source: ACHHUZ5I3EqK1hNzKC7AuybD3Hi2dLS3vQvGszMQ4pxbllDiHc4lA2BR2n7uw+7WAh4xdcWs7IIlyQ==
X-Received: by 2002:a17:902:ce88:b0:1ac:373a:7323 with SMTP id f8-20020a170902ce8800b001ac373a7323mr1958940plg.16.1683232469791;
        Thu, 04 May 2023 13:34:29 -0700 (PDT)
Received: from smtpclient.apple (184-167-248-253.res.spectrum.com. [184.167.248.253])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902b20400b001a96496f250sm20198607plr.34.2023.05.04.13.34.29
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 May 2023 13:34:29 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: phosphor-state-manager: creating a log for chassis power on 
Message-Id: <34C873D0-3C90-4ECC-9622-31479967B830@gmail.com>
Date: Thu, 4 May 2023 14:34:28 -0600
To: OpenBMC List <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
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

Recently I added some code[1] to PSM to create an informational log =
whenever the
chassis power transitions from off to on. My thinking was this was a =
fairly
specific use case for only certain people so the intention was to just =
optionally bring
this new feature in via a bbappend[2].

In the review, Patrick noted that he'd seen a similar requirement =
elsewhere and
votes that we just make it the default in PSM to install this new =
service.

If anyone has an opinion on this, please weigh in via the gerrit[2] =
review or here
via email.

Thanks,
Andrew

[1]: =
https://github.com/openbmc/phosphor-state-manager/commit/afe12d69a0c8182e7=
b587d81531e0a9e376f5ce7
[2]: https://gerrit.openbmc.org/c/openbmc/openbmc/+/63078=
