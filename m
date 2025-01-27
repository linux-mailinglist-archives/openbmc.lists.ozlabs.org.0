Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98AA1DD7E
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2025 21:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhgNq02tBz3bZK
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 07:43:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738010600;
	cv=none; b=mvTpp+/4MA75AFhgbBCAzuFVT8wrx/vBiDVxz2R9uWe+Wb46t9i9if0DUznMxTRiqBJ0lUiZ18hQ4Ap3RfMOtRmrD5whFbAQciwGvfJoOLu7jtyeH4wLgGjzxzFGmNvnShl0jAY2g+N7Pf4vpjd+zL5/G12lcSzhuxCCXSwogNoFn0zhGXkQUUGvbdmLXcJRpW+BKwGyDpJllyKXoN6LaRabJuMAAS1r+5a9aEpGhztM1KcS0GN5Q+TIGle2ZtlbQizRRyynLXzy3zcOWTfJsyztY3R2Y3QmNp0v4uVD91DcowPMBzPlDuhWtuKuZZ21dv3Yt3TO5MV4vKvWPNbzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738010600; c=relaxed/relaxed;
	bh=bVpYogY0TLUVz100Ef2PIk8u5qqrjoawZ6XH+1SalfI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=KHYPrvkKbsNAJgzE0d9gLAylOXjS7fa7LyTurE+q+BPjsFYHpU4Fax6UAzS0ZfjIpWVi/CwC4JfX1ZnH5xCFT5cfx7aFCWUlMlPqNSUEAkMM+gCBANhWzyJI1HWSx1Mm19BdlAdWn0VwyITpzmixu0n3BmRpuxC5miVwGk8Grr3XcMi9lGPkb6BE7V9sCe0l6o1hXBcgwSaYG19j/wQRgAL4caNCpzCcN1ECZMq4g+l44Tq1P4fE1rBtTxjBggg6nkg1iuoESGSwPi8lkqOD1nGG3OemZqynixGivDjsmSXM2wRA6HuBp85xBc/lUfKdx6ReJxa/94Y06mb+j8anpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bF+LFs0l; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=woodwardm@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bF+LFs0l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=woodwardm@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhgNl1hkxz2yk7
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 07:43:18 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-219f6ca9a81so2955ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2025 12:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738010595; x=1738615395; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bVpYogY0TLUVz100Ef2PIk8u5qqrjoawZ6XH+1SalfI=;
        b=bF+LFs0l5jaaJoNLdola6L9JqrtIGxEGKm6gYK1BejeIx88Bsg+hUxGBo1+jdP8P4Q
         J+98WJyqyYCStk04HCKJ5qO72MBlSwp3r8Ceeuoyv0LfgqYFnR86/QcyJbb3zbmWlgf3
         J4QK1lLSj5xEg36099MrbABYWXdugVP2T0TKWZyKsTKPW3LD2zhx696GqiqkzBanGiMi
         gj9frrRm71My6bSJtp9dIvMr9JNI2ICcm+QnfqcmhVzB9LrwDyKOYvqbdfJKThPXXWVc
         4/GkNlBHFzZmYNQl1Ig4RpznWVZA5BK0TaRtIzqNR9qlG0OFQwiqmPKUAKZP6QSZ9iG/
         cmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738010595; x=1738615395;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVpYogY0TLUVz100Ef2PIk8u5qqrjoawZ6XH+1SalfI=;
        b=mY1pcEk0jadSWHzJk+jlpgOm6ZhjNhrOqjv9pL6vaO6cmZ2/XW0RjznMJeJBALO9Du
         BB6eOyLGhJQL2dUu67jP4XYzeY+GN3a2F2pGqtX9+GVcob3jbLkJPw6eS3Mtv7Y7Efjy
         31zxCzhPFR0WyA9DtvHeoa2+/DjO0aJcpRCSQx23mx2oelURKOwmH2TriiWDNaYDXsHb
         +0WpCqBaCxsZbUdJrEzmfNOG1rNIuxix5DbKI9fYm3pLip3qQh6sO/jUirgyeJGnj5Hv
         KQHDLcIUPxAMvnUiPLBLoJl+HF0OcCt9fN8As0Sn2Td/uldFzVWdalWP/AwhmUN3HuY2
         HfjA==
X-Gm-Message-State: AOJu0YwkyuQOlSIOgfxbgdDuc7IMhhBnaLwDOfSXYO0aDEqW9iadpb9f
	q9103CqnSa3pTIKtvA0K1yO79Vtr5agqCtax/zFAWmQNoYiX+StxN7taS2L+bi1XKhrFCTyasyi
	ceTE+HqjBRjO8Fe5/qUmXU84UjNlBMWkj4Bf+hugUvrBs8EVwhdVl
X-Gm-Gg: ASbGncudSegLTUdDkBuVY842TsMlCw8zi+N6xiR6oNjkiF3tE4cdwSFQ+1d3Ey6XVQ+
	3TlQvdd6jpCEXPb3GImvR+Q0ZLmvIy2VIDxVmVcyT+RAsefVI/dZfLBb9Yt21r2Uf/ysHKMwAwp
	nz+qbjU//lWWTM8uXhEJWk
X-Google-Smtp-Source: AGHT+IG3gt7fbOCCfn5toaq+RKKIv4u3EMaBvAfLd2dresG9nEfBxPeEhtZPJnYl8bhNXyPscOgP3qSPkhdz43QeWtE=
X-Received: by 2002:a17:902:d592:b0:20c:f40e:6ec3 with SMTP id
 d9443c01a7336-21dcd4f8c5amr219565ad.22.1738010594749; Mon, 27 Jan 2025
 12:43:14 -0800 (PST)
MIME-Version: 1.0
From: Mark Woodward <woodwardm@google.com>
Date: Mon, 27 Jan 2025 15:43:01 -0500
X-Gm-Features: AWEUYZlZ8lXnrx9inL6WMLSKIuf-oMgxN_sKvFeaRmv9IABZwssJnAqWODuYoe0
Message-ID: <CAE0x3M=FXi+KWuMXjRH38zSeE3==0ALtCHemn4DCxdwU-S=jCg@mail.gmail.com>
Subject: PSUSensor.cpp - Removed PSU
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001e7682062cb620cb"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001e7682062cb620cb
Content-Type: text/plain; charset="UTF-8"

We are having an issue with psusensor in that when it is functioning with
or without power, psusensor can read the status of the PSU. If the PSU is
removed, the status of the PSU is never updated.

It looks like in void PSUSensor::handleResponse() when there is a read
error an error log string is output, restartRead () is called, but there is
nothing done to the sensor data. This means that when a PSU is removed,
aside from the log entry, there is no change to the sensor readings. It
will just continue to report the last readings.

Is a PoC, I added "updateValue(0 + sensorOffset);" in the error stanza, so
that when the PSU is removed, the values are cleared.

Is this expected behavior?

--0000000000001e7682062cb620cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We are having an issue with psusensor in that when it is f=
unctioning with or without power, psusensor can read the status of the PSU.=
 If the PSU is removed, the status of the PSU is never updated.=C2=A0<div><=
br></div><div>It looks like in=C2=A0void PSUSensor::handleResponse() when t=
here is a read error an error log string is output, restartRead () is calle=
d, but there is nothing done to the sensor data. This means that when a PSU=
 is removed, aside from the log entry, there is no change to the sensor rea=
dings. It will just continue to report the last readings.=C2=A0</div><div><=
br></div><div>Is a PoC, I added &quot;updateValue(0 + sensorOffset);&quot; =
in the error stanza, so that when the PSU is removed, the values are cleare=
d.</div><div><br></div><div>Is this expected behavior?</div></div>

--0000000000001e7682062cb620cb--
