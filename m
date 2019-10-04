Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78893CBFAD
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 17:46:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lDkL6L5VzDqfP
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2019 01:46:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cPiJ8R5Y"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lDj63sQLzDqdq
 for <openbmc@lists.ozlabs.org>; Sat,  5 Oct 2019 01:45:12 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id q1so3998919pgb.0
 for <openbmc@lists.ozlabs.org>; Fri, 04 Oct 2019 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mByU6edxI1o7q7++ia/8fTT7m5fl6XoVtGE3vLSDTjU=;
 b=cPiJ8R5YbYYY2jWBcxXEh3nHZGaEdBGPiOYsBpjyPY971bRBEdvUi8qYjkVIHvK5jc
 LQEMz/VWE6QruAfzUDnTr5mMsyLAKGQEwZsRO5U//Y/i7FyJ0GOQvJOghlNvvUrYkwob
 ETgHyLsTNmcyxoYheIxrOIrYIpM/gT5m1W4jupHwu6DpKfJWOKQBE73H3u1VsQx6hJIE
 YPorwp4ZcOCv+JxMc+nbjo+npn/75BovvpzANJa7CrfQIsthtnn9T+tVk4CRRMctcfV3
 GjA7rGuQOairlu+4KVxq8ZNk1JNgZnb7jehZaTRsI07YW63I5N9jBMUBZrLlyMPbw+j7
 RTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mByU6edxI1o7q7++ia/8fTT7m5fl6XoVtGE3vLSDTjU=;
 b=IATOBqSXyzXt/Kf2AnVFWu0Pj+Hmu0OK0d1aZiRBxSQU1C65tdFdU+lVDbtVjwk6M5
 +yutWAxn9WWmOBdJfPYWWT9MGjtHuk+2QlZpvljQJ4+OKa85toJhHxMaZhHrAwr51kA0
 Z2qPBuW9Qs4tpb957bvD9+Tt+o9lJ1MWQTODTqF1hTQgyjU1UGiQ2SIdWmVqmQJUl5E9
 FIEj1JaSVKWoBoYTbH1/qCH2XEKoRwfs9E2c30RQVuGtmzX7UvIbw7gnDVcis7FT1L4l
 dJ68tqDNNDlLPRVhH2MVv74LoQKypwMDxGadrRegLDhIJPI0RhN31dS2WYEFSrCpGMKB
 jP1g==
X-Gm-Message-State: APjAAAUo5sUav4m245t/KMsemZM4UX11zrvF1/3CF+BDSGuKyyL5DSxz
 xxey1bUpqKMEB4AwaGuUsv+jL6zDDqZom60qz0YsNS6F3WE=
X-Google-Smtp-Source: APXvYqw8yJ48LtHTlgqipYCoqfanYx4sbaS4cTRy3adTSaEe5pwd71Ilq1rzXqINGL3ePoN0mC0q8L3ZJTkFRMI4ZwU=
X-Received: by 2002:a63:cb4f:: with SMTP id m15mr15870415pgi.292.1570203908637; 
 Fri, 04 Oct 2019 08:45:08 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 4 Oct 2019 08:44:54 -0700
Message-ID: <CAO=notzdWjU+9=QDDNinY4sOwfeOQOryF1CLf=xk0p1v3Oimiw@mail.gmail.com>
Subject: Testing userspace code
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

I've been working on designing a test infrastructure focused on
userspace aspects of openbmc, and since most daemons only need to
speak dbus -- I wanted to reach out to see if any team has already
designed/implemented a system that takes an environment description
and creates a dbus representation?

The idea, one daemon runs and owns all the dbus objects expected, and
ipmid/bmcweb etc can be tested by talking to that daemon.

Thanks,
Patrick
