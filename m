Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3AE63F1D3
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 14:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNHGY0w9sz3bdS
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 00:38:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4ntPPkjn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4ntPPkjn;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNHFx11nMz3bXF
	for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2022 00:38:10 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id 4so1703941pli.0
        for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2022 05:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WwPhg8X2+1Xj6A8MUpV0hNjQnXIQSOz5j3pFrwY8bvc=;
        b=4ntPPkjn1r/o6AomuOYpQ/LOGyWemguMYJ2hdJxUGCxKy0avRJNf37uEVpWj5YpwxX
         GaXz3aY4WhBJdQUUOY8vctr8L7lqQ3ejFNJ6jkpKciYFcVTQfFOdRzPFolfiviAvRCe7
         pe/1sj+fZar4ndXAkyU7UHDSZkY4U66qCLjuPIYA4zFWrc9Z/PLx1KkuJVpoH0rhq7Qq
         4cRD9jnsT0UFmQxdNGit5qyWmm3cLsk6ahUkmtyi7K2PBFqcdIGnhaYvDHGhb9Xq2S+U
         RdMNL6+TOs3XT5SWcPh4jYJIG66MNTKBsD2iUpaDLPyJHYQfAk6o+xUyaMDNypew9+QH
         ReCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwPhg8X2+1Xj6A8MUpV0hNjQnXIQSOz5j3pFrwY8bvc=;
        b=iX7ekgxa42+mRmLCSK0TdUK2w+MMbONV+gPLw098qI1ggsgxMtnKdKAag19yMe0fPm
         7OTCI2x2lrzsjhnuUUeptX2zKGqluywtt96PW746Z/ol0q6S0qzQnwrTK6q0hXTeNq3d
         4E1+NocrmdVHBch+dC6WQmHMN8ZpGeAjFHfQvG3ykE9C4viHTJ7Z+mhmpUD1MFrUogiL
         F4UVHFG9B95/FUFJdYFNkLMmqwClfBSn6r9sZeGWvy8wyoLL6Hxigj5vCD3qemBdSqG/
         WhGteV0tJdMfEhBX5e2qs21Ulxml2Enwiup324vV/lpRKyGYM8fQiUYFI5sRIW1q36nb
         8Dxw==
X-Gm-Message-State: ANoB5pk95qQRGU5+7izPm6YIvGRzQP6buUiTjDpWQTmOYswyaLVOflZW
	+1eFEbWRR22ZJE06zFcXq/HK1rNulCqAy63Jsfc67huEbbuOB0uB
X-Google-Smtp-Source: AA0mqf46g2FrKhgaFL2jDGffB+nHSZE9CdkLP/tVIQxf7jpQb33ZLyPV/hu1+SgQgze6i1L60Oty0itFHhT6InroePc=
X-Received: by 2002:a17:902:74c5:b0:189:5e36:c051 with SMTP id
 f5-20020a17090274c500b001895e36c051mr36137248plt.174.1669901887731; Thu, 01
 Dec 2022 05:38:07 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 1 Dec 2022 21:38:17 +0800
Message-ID: <CAGm54UFOHuVnC1ta1PPbr3TzS4SS4=nOQiHuJ65YbD_1WCD-Cg@mail.gmail.com>
Subject: Missing fan present object in fansensor (and expected usage of object manager)
To: openbmc <openbmc@lists.ozlabs.org>
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

This email is to discuss an issue found in fansensor service, and
about the expected usage of object manager.

# The issue
With upstream dbus-sensors (7627c86), the fan-present objects are
missing on DBus.
The fansensor service should create objects like
`/xyz/openbmc_project/inventory/fan0` to represent the fan presence
status [1].
However, with the changes of "fixing the ObjectManager in the right
place"[2], it creates an object manager with
`/xyz/openbmc_project/sensors` instead of `/`, and the objects created
on different object paths are actually not created anymore.

I see there is a fix for the "control" objects in the fanensor[3], but
the fan-present objects are still missing.

The fix is simple that we could add an extra object manager on
`/xyz/openbmc_project/inventory/`.

# Expected usage of object manager
But that involves extra object managers.
For a service that creates objects on different paths (e.g. sensors,
control, inventory), should it really create different object
managers?
The caller of such service (e.g. bmcweb) usually calls
`GetManagedObjects` to the object manager interface to get the
objects. In the above case, it has to call `GetManagedObjects`
multiple times on different paths.

So the question is, what is the *expected* and *proper* way to use
object manager for such case?

[1]: https://github.com/openbmc/dbus-sensors/blob/master/src/TachSensor.cpp#L77
[2]: https://github.com/openbmc/dbus-sensors/commit/14ed5e99
[3]: https://github.com/openbmc/dbus-sensors/commit/d9067251

-- 
BRs,
Lei YU
