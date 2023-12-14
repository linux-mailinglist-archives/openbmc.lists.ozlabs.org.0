Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA4D813396
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 15:51:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e8OvA++2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srb0W2zScz3cZ1
	for <lists+openbmc@lfdr.de>; Fri, 15 Dec 2023 01:51:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e8OvA++2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrZzy54Rhz3cQX
	for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2023 01:51:24 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d9d84019c5so6274653a34.3
        for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702565482; x=1703170282; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ruAKoHR9uGWS3VSb+UagxtJ2MsgxlhVIrFdPwcI9KzY=;
        b=e8OvA++21hJ+E2yCpIR57SZ5tTnE0Y19lKN97VmdGJx7Gn8//5BcovGTiy7bUgDUwq
         f47dmXOB/Nrwd2cbM9m07Ipnd+c77Uxmfm+1fNe4A2Nc9dRv9Ee0zQkSIUKoNZyGSi/z
         ssI2nJGS+1okQWH7D9GGDz2fIw0n4ys6DwNz5ftgR3wYkfde9nFKXZApYL8ZEsCg4Vu5
         BJG3wm6la/mLp62Gf590NB9ioq+uxP+ZdRrRc3PPXvZZaHG/NWLkdhuuQ/fUdBm3Sh09
         M4YdwaBfiq+lOxMC/CEIBAy0aLdo3CS3a3o6A4Kdeku8M2YpMS5eaVzUL6pV8CouAQD0
         239Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702565482; x=1703170282;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruAKoHR9uGWS3VSb+UagxtJ2MsgxlhVIrFdPwcI9KzY=;
        b=T0d/hw3cyDjvqQvDlXXjw82yd6dZXJYJGaIjqwrLcVSSupXsm2bmAkslBLzOgbSW8I
         d071M6AKRCWAhuLide45d5Y4v3dJBWeUpICd57KBg5UXr+W9/44neJ1K/Tn+JjzCGbVz
         NglD5sUfiJ0YDtrGGWExoT2xCtYhaBbiQK8U49/MYAS6jaA0s4Uxf5nYRwYAi0HLnDsR
         iy9YnmrrZNoXCO6TjFzs2w0k0M+fQaOP8JK3qtb1stMrml6ikC5EFFxecCccNyP5QWg2
         5/oP7/qkSmytBTmEbSK+5sif4PocNqngCgQJ8N345ckbhbqF9uQsnRvQQgUlvIVZfA/C
         bQlA==
X-Gm-Message-State: AOJu0YxZtiwJfF4m0KbrfhAAgjxS2VtREYfgdhycn0XGkcCO+XsaE2Yq
	QJKiQHr/HIrlFhWUnisxDq06t0Hsh7/GCNWxTXykmTVi6s4=
X-Google-Smtp-Source: AGHT+IFMhVqRaH9qQ5FOZIJJSqn/UtQVVSzu28dozb9YTq1z+R7QqeguWpsj4xayOnON5yZ4yFe+bX2DxPchSyZbvn8=
X-Received: by 2002:a05:6870:808d:b0:203:2f07:9c20 with SMTP id
 q13-20020a056870808d00b002032f079c20mr3202300oab.26.1702565482010; Thu, 14
 Dec 2023 06:51:22 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 14 Dec 2023 08:51:06 -0600
Message-ID: <CALLMt=qMrBpSvK7XeuRJefm33tqcDtBpqVOAUj88AQjoDN3jPA@mail.gmail.com>
Subject: Gerrit Upgrade December 15, 2023
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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

It's that time of the year again. Lets shoot for a gerrit upgrade
tomorrow morning
(US Central time). I'll take it down around 8:00am and if all goes
well it shouldn't be down for more then an hour.

Andrew
