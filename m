Return-Path: <openbmc+bounces-696-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF463BAEE93
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 02:49:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cbxCN5knnz2yrT;
	Wed,  1 Oct 2025 10:49:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759279776;
	cv=none; b=Xp4Vg0nKCzOXxo4AXkpEgy6xfV0eLXh7lLrnZHwWMMHTWip4/lsD3dolnWvwIh1XAzeb+F++3theAq9MBDaZvxv4rCaQKgiFyTWkMBqWyFmA1oZV5d3HMWyjjsNOSvtkzhqzFfLFtIpElDxcVYvuvHuLOvN5p6rMm5IcvpSX6wba+pdzUzeQ9hBslBZW0RhxoKeQrMHHXlrb+i2kUoQyDWC9C9lz/a+wVXfjWMZXidTRwEwgVqfTkdK73zkUjDeLcbrNF6QIsASI+xRBIjJrp2BWKb+TCZJYF8NfLjNoFWecB4Cc8DT58PxdPQrmhW1+AOeruzx2UJfx9EJbAO3Vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759279776; c=relaxed/relaxed;
	bh=KenZ54nArmNhZBAX/MjnhpbBV5qpj7dsoC5YKk4A5K4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bGzZgYj7CC/zQ+EKI/b2TIfallFW1LVNxqP3bVKapct0NLlDJ5ZUX6az5uIfPWLaVJ4LVB1lhGITioHCw9N8awrfXh9JgMXf7yzW1acNa1Pco18icdhswIWihYusWvZYCY0i3xgOk2e2JdKSK2yVYw90SXila1/N8jFqjdCeRa7hzCF99PyvNFf0mhcIjJjm5yL4vOQ3FMFrDsB0Ps9KfsrX8ps8b1u2ZII78XMUhcZYk9Qgu9jmWqddEjAdDP5JxLhWehvi5ErIj4QseRQTTeJL2N2cznh/Wefkvh1ioxD2cF/aO+Eb96W3KLv6d7O6mkS7s43q7RLm4SeJ/PTNrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j8UNYUL7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=twpeng50606@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j8UNYUL7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=twpeng50606@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cbxCM6pSbz2xlK
	for <openbmc@lists.ozlabs.org>; Wed,  1 Oct 2025 10:49:35 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-782bfd0a977so3015635b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 30 Sep 2025 17:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759279773; x=1759884573; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KenZ54nArmNhZBAX/MjnhpbBV5qpj7dsoC5YKk4A5K4=;
        b=j8UNYUL7RikhgtYKOCcaXqC+6102rfNV5yr5LQzTkh/pTP9pIEjtAfIubxhd4iFeUD
         6WG15K+h08TiJpPKScBH8AY5jITdXMJ19a3I5d18R4O1jjApiDjrAifkAmOsXBhS1nUS
         VXutGhmZXu9/qj7aIV4QbKIJ/gK+lOano4z65Q5GA2i/4G9L/vZb1etz/WqmP5qy7V0F
         pVHDu8fvjVZTa28ltquG+6hPg/krAxbVrNOViFGRhcbeHRWmZtBV8LOHjjYWxWrgUHv2
         +hp7o66XTCsVSC8R2E529VkqXSbsWZGiFNbNeTGD65UWP7PoT/85+dRn0n04ZCIlG/vr
         J6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759279773; x=1759884573;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KenZ54nArmNhZBAX/MjnhpbBV5qpj7dsoC5YKk4A5K4=;
        b=UaQLpNkKx4A1ThedaH27t+JG/ylQJTQM0T4gQ9a/h6sokcoVyoNnAuWU3MvIiaOivK
         GkSKsVq5saoXuah7qtwOnn53SVIw2+L06OWcla0oDL2Yri3w+tXL/lWDkCs6kxyeHtaY
         Qt3AA/E5isHnNUzbZlT7YIe2qqoumvVEQUWlhlt6NiBYbsBAOD/2Cn0nlmx4Jx6CKl6W
         2eQCUhHrAbxFOKBkQ0dSKk4UgA/ZpTGzAvF2lDCKidSRm/Fxl6SwP9upF8UTYPRzAaOw
         P6J9jlgTtzcz4UDa4lrfOe3IZpk7lmexWpwsYoDOwY3dfMs+u0yD6tZhRbpiUnhf/pf1
         En5Q==
X-Gm-Message-State: AOJu0Yzal0PU2szAuiUJiHzOGiNV96sXmdDR4w+UrHkLj6N3A7jpDZhb
	Z4W47EMsVk9wGpSEtuCnroIAQiI4JNN8LadgAcQWGlMyy9EnZB9LFYY3uR75BeN2BxzgH3CrCzt
	FAUa685lq+ChXITylXy52A8HqGkTBvgHNfnAS
X-Gm-Gg: ASbGnctvFsvadVepz0YBZmXc8qLkJz8c2O+8RfZFGr4YjfwdqC+sUg19FrGQh6r4Pf/
	1jlBQzX6RTxRklKhGwReVORHnnH9582m79wbO8eesVbnafBWno17OvxRwIqNsVaq3iFjQWQ42n3
	gAchXPKfckP/VvGVa5dtuQCdNFjgr7SvCBQ76MkmaHmwh5P/PeO+ejqRSWrQoNM1eudbwzaOZtF
	0KykzNE3rI7aAs7uqCHQXgq420MvlRR
X-Google-Smtp-Source: AGHT+IHnDR06AgSZUbMgXbNRsiyM61v+ypGHCr66NiOBrKsMzS7BxyfArqTrgDcWUY+uF5+4KA3mIhTgidx1Q+hbZOg=
X-Received: by 2002:a05:6a00:815:b0:781:2740:11b2 with SMTP id
 d2e1a72fcca58-78af4223e4cmr1545238b3a.25.1759279772954; Tue, 30 Sep 2025
 17:49:32 -0700 (PDT)
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
From: =?UTF-8?B?6ICB6JiH57KJ?= <twpeng50606@gmail.com>
Date: Wed, 1 Oct 2025 08:49:21 +0800
X-Gm-Features: AS18NWArq7vqxC0Ar2n_EAo_vF_lTU2Tw0yK63zKQ2tcaU_mQDqoc3Q4DRwKOK0
Message-ID: <CANbCeAEeNUsV82ae4AexY-LNAh7UHggaNMQ3+gcguxFY1dq0_A@mail.gmail.com>
Subject: Request for Gerrit account approval
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ed751a06400e3d06"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000ed751a06400e3d06
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC maintainers,

I recently subscribed to the OpenBMC mailing list and submitted my first
patch to Gerrit:
https://gerrit.openbmc.org/c/openbmc/phosphor-pid-control/+/84144

However, my account (email: twpeng50606@gmail.com) is currently not
approved, so CI is not running.
Could you please help approve my Gerrit account so that CI can run and
reviewers can proceed?

Thank you very much for your help!

Best regards,
YouPeng Wu

--000000000000ed751a06400e3d06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC maintainers,<br><br>I recently subscribed to th=
e OpenBMC mailing list and submitted my first patch to Gerrit: =C2=A0<br><a=
 href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-pid-control/+/84144"=
>https://gerrit.openbmc.org/c/openbmc/phosphor-pid-control/+/84144</a><br><=
br>However, my account (email: <a href=3D"mailto:twpeng50606@gmail.com">twp=
eng50606@gmail.com</a>) is currently not approved, so CI is not running. =
=C2=A0<br>Could you please help approve my Gerrit account so that CI can ru=
n and reviewers can proceed? =C2=A0<br><br>Thank you very much for your hel=
p! =C2=A0<br><br>Best regards, =C2=A0<br>YouPeng Wu<br></div>

--000000000000ed751a06400e3d06--

