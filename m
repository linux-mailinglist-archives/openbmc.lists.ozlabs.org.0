Return-Path: <openbmc+bounces-128-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE6AD0AE1
	for <lists+openbmc@lfdr.de>; Sat,  7 Jun 2025 04:02:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDhJr214yz2xxr;
	Sat,  7 Jun 2025 12:02:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749120472;
	cv=none; b=n0sGCgJhSuG+756y8Auuw26xq1ZZ1pU6tA8eltHC9CTJQEHXI6wbFxQdNruPLL2LV1R+8e62rFTEFUOCSfdmkBPWLom40SR9jFxDgeIXef0KzWcMmZ2n99oWC7RgQaNbXJZjEpRL8CtkYB6ap7K7nLQGb9SccFgoiKt5Z3EqYztb/3rIgRhidWM8PFkw48yCOSXgXHVVJYKRJTAPBWgxx4KfXAmt8YfeFHANg5Y2y3+a++4WoBfKT5TSFx6Hp5VjZxMWP91DMoUjLt67uZbT1s8DulrNdOMWe/1kMZn2Sea4K66jnjokcLX5KyuoN64NTXlrHNjN3FHdVlP89SS79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749120472; c=relaxed/relaxed;
	bh=fqZqlKoVW48VGLpKTbygRPBXqHXpHusRs03PuYmJdHs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OzCpYn/s7MY7N4bD8RfbWSMKIqFLv+55S/Gr2Jf9NllTEJ92xhoHnh6Gu+yYUshUajV3gducNNDt0xadHXNma9zDo9mbHm5i6J59Sen/rbcL8thtWZ+lWoLBlTNSFkLKJJ6jwSwdvGIFbj1zidcaGONnfe8kbN1+xMngahriybUsA2FQxbFeNQU2mKFE4hxm1PzskL1cz8LAHRPp4xoUbSXU9Ni00iCQ20PTgIKNjF0c3k/Exubszy8gIxBfPzKNQD4CL/o4xbAssmFeA1+AzX0oNxI1ygMBupzXULbwVx7iTP4EnRJTuR+o5xaBxy3hVNu8XcT2XsbpWWOFKTnZUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ST00j7+Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=bsneha309@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ST00j7+Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=bsneha309@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCh471g1Sz2xgp
	for <openbmc@lists.ozlabs.org>; Thu,  5 Jun 2025 20:47:49 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-742caef5896so779922b3a.3
        for <openbmc@lists.ozlabs.org>; Thu, 05 Jun 2025 03:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749120466; x=1749725266; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fqZqlKoVW48VGLpKTbygRPBXqHXpHusRs03PuYmJdHs=;
        b=ST00j7+ZsatBJKRHf3buAvbuq9EL+TzogNoS5k7EbejXvpzeSAvEOQPsMD3JhJzeIE
         Hmtf0u30x5kaZE6+l9H5wgUaj7FQExZBuI1Uco7EoH9GahKtf3CfgqL66++DjywUcP9/
         a6vqGIvBG4iC+vpmWUSXc9/lJK+1tw6Im0eVnrJ+JLzKjCc85laJcrAbmsC/mHBZBIXh
         bXoF6NqN1sCfvlEnT6HZYuKcOJJJB2kKWuQpAGM8WrynhRfiV4R6YEfwQ8w0HAoWWgwQ
         wr7H4Q9XpcsBG46U1q373CYpkOdksBbA9zFteeRC99wFjKDc94Ajuj3QIw+exD8Ruf3E
         1Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120466; x=1749725266;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqZqlKoVW48VGLpKTbygRPBXqHXpHusRs03PuYmJdHs=;
        b=MMV7bMjIpMduXEeVsNdJiVv/UPilS1568s2zcG6GT0HHLuyLVVhWL4tXU9/y854s82
         pCz2j0J1nEF+24umH3dVDf0XNxndsK9XL3B123EkseDbSEIxC/nrtgpR3sJYhrYHVLUJ
         8RE0jPocgxmgkPprWuFK+3CzEBmrGh12Ft01nwU6YZO8G24KO4tRc9CCmZd4UJhjbyab
         IVAXcR92gLpi+3tBVAfZm3FgTmbCAUNg44tK9H6aAtPEZVmb5bh40TtdHWIjfR6wnbgA
         mhsOmgbTg7SG/5qCe7H6LyRK7xP5RnQLBCwMb047hHCAsgc8ofXmlxmt4JVVe5wZdIJe
         qoBw==
X-Gm-Message-State: AOJu0YxIf24Rdh9OUbfE7IZNqPRP+wulUAh+bbMpVRQlpSEyrFTSiW9y
	fgZa/zlkc1YEj9GUYNKUxpZEA6EjtTh5Qsccf7yQYzTL1JytU+2lPYgRM5QKIFyyFTmM04nvn+A
	C8rPeBvNcSXfcrz5cuqlX50Znag9FrG/0EA==
X-Gm-Gg: ASbGncvNscKKAFoSeLMy3eCzTqZHskTkvQbVZ9OasIiG9ExkAi80jO13h5yf/UGuLvX
	GtWurQfE7iEsYny6RVchxhawIV/L4pnxuqDq8KlluhULWXjb9AxUGAuFdvCHCC/693SEqNMDZgY
	5rAqEEobB2oP/R2RELSXbGx0gEEXZWL7cwnVk=
X-Google-Smtp-Source: AGHT+IGkwters2WDb0uLIDc0IaqC6YvRvQ6Swa9x4Vm9ArJW0q9sZPnzwLvibl8czkQ0JVfpLARSRnOvq9niw4+JL2A=
X-Received: by 2002:a17:90b:2b8b:b0:313:27cc:69cd with SMTP id
 98e67ed59e1d1-31327cc7455mr6471242a91.12.1749120466371; Thu, 05 Jun 2025
 03:47:46 -0700 (PDT)
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
From: Sneha Bansal <bsneha309@gmail.com>
Date: Thu, 5 Jun 2025 16:17:33 +0530
X-Gm-Features: AX0GCFuD9fUsDnZ4CpSIL_M-6OdUIJ7-Otispa7T8GWqODLdD53VTHGl6yjtEfQ
Message-ID: <CAN+wxKK1vwqhCRQ56km1UH6Oi79DAcVeA7t45MWH=7P8nGbOBA@mail.gmail.com>
Subject: Query regarding libbej library
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001148880636d0d89f"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000001148880636d0d89f
Content-Type: text/plain; charset="UTF-8"

Hi this is sneha here, I was  integrating libbej library in my codebase but
was facing some issues. I have few queries regarding the library. Can you
please help me out regarding this? So that i can clear my doubt and perform
the integration successfully.

Thanks and Regards
Sneha Bansal

--0000000000001148880636d0d89f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi this is sneha here, I was=C2=A0 integrating libbej lib=
rary in my codebase but was facing some issues. I have few queries regardin=
g the library. Can you please help me out regarding=C2=A0this? So that i ca=
n clear my doubt and perform the integration successfully.=C2=A0<div dir=3D=
"auto"><br></div><div dir=3D"auto">Thanks and Regards</div><div dir=3D"auto=
">Sneha Bansal=C2=A0</div></div>

--0000000000001148880636d0d89f--

