Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 884FB1520BF
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 20:07:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BvMM5kRTzDqQR
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 06:07:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WWLqmVP+; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BvLl0YF4zDqMX
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 06:06:38 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id q84so19599547oic.4
 for <openbmc@lists.ozlabs.org>; Tue, 04 Feb 2020 11:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8WhLkgIZ76gOTXrspwGVvVmeojS2tnRjwDQgTr1x2y4=;
 b=WWLqmVP+jXtLbvaBoAUWtwZu2Q5I9jkG3/OR2OJendiaUWFEYrKREh8aObwLHGWWGo
 9/rAPmEGccJNJqG9aoehum0sqCtVIZIa7Qsiu8fWsLv6uV4/hT2YMl/lxTxyOhtPpGo6
 To5ao+jIqHUbMLiL09wrEwYZKC98hO9yi5+Z6zHzPCqxr3v/ZYfuqVSz3fIB8UywWI54
 kWH263vE94XPefbmb6GmVDAdU9oheLLJUkqANwLovkdEgtxMhhhcsNbFda3lyR6Aff3e
 qYXxykNZ4cYRKj5tKeL5oQU2N1zxY+oAtVbI1pfjNGwORTDIRp/xn8goqNoRnQfYitMx
 I2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8WhLkgIZ76gOTXrspwGVvVmeojS2tnRjwDQgTr1x2y4=;
 b=mWqYIP/TpOTOzqcrKE/3nbmiLa8EFtQdGe2nF5VWUn2v2hzPLSJkGGqxUVit6G0tLZ
 tQZqIDAMbeTvfmmL7SZEFMvWSeIi7xqz9BCuqo74NECcJb0rVEGilm7sI19sZJL0L06D
 cvCO3243At4WnrQttLUPNiRpeghtrk7oaoLiFifaU+z8C20HBUgpvAFkJ56o1LGoXXur
 hrrbwgnQvW/I8yKzP+GGIRNW9B7/XWXSq8KKycgj5CHwiqRAZR35HsNBuq0MZFdz9nUF
 icI3xxT2352umM3iTQ4tSOYNcbQ/stlsyfStomJOHs1/H97Fg8PRef6H7/gGcxpXSod3
 qUPA==
X-Gm-Message-State: APjAAAVfVehF1NITKQhmPxLUkS6meSsuvMuXqCuaQzG4kpAu3qttW5+w
 Gw93bs67j8PWs3QIhYfkGKOvoa8UadaMm6r+NRq0ELaR5pg=
X-Google-Smtp-Source: APXvYqwYEVXe4v8O4uzjhgV6kdlZw3x12791pQu8Scn0lKoDSlBhlVgFN1eVtmVIiRwvhudkN7mg3a47pQgOaLzF3zo=
X-Received: by 2002:aca:45c1:: with SMTP id s184mr342761oia.158.1580843194755; 
 Tue, 04 Feb 2020 11:06:34 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 4 Feb 2020 13:06:19 -0600
Message-ID: <CALLMt=p1DdMZoQ8GJNpJqP51L_kgufy5TXDOTc6n4KJQzJCDrg@mail.gmail.com>
Subject: moving OpenBMC systemd targets and services to phosphor-state-manager
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

The commit messages have more details, feel free to weigh
in if you have an opinion.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/28432/
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/28807/

Andrew
