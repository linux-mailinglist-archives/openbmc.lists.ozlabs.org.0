Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 294A8A348E
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 11:59:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KZh56tx4zDqpr
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 19:59:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kAZYUnkw"; 
 dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KZgQ3DjpzDr2k
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 19:58:42 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id g111so3336673otg.9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 02:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NSkljrY/kOuoBKvgehA3pQhbAS7x01i7e/qdHz3BPto=;
 b=kAZYUnkwLKxZm2cbjnxTG2A0R9bHkwRm1CJlqpNIn/oNb+zG6MU2Km50k68d/4GTOe
 DiDWTzmx7Ok8g/hmleIZKjI5SA5iX3ydwIJWegd9TKo0CWbEkAgYz3kBWDdsMrorC9IM
 5yXzagQY/2gyLQwjUkBk3j7Bg50YLzaoRbq5YMOO15YTUVlcnj/NDfjJUmHDJdVHdw5c
 HC/V8GnOjLKVkTb2lRil83wsJlZkY4YdoGWcscNp3zPAt4sgRL8gXelc2GgUAaZ9m5rd
 cZlFIAmB/mFTNP7D2X8T7fdQIfcjMkABwBDwrjchB/raY3hBm6IeFz4OTCBDrFVLUtnC
 vt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NSkljrY/kOuoBKvgehA3pQhbAS7x01i7e/qdHz3BPto=;
 b=sxOjuibng4MMNSTeQnsw6IrX+b5VS+gNpCstQjuZOZhYpV0VpbEvKPCZzXtESUpJcV
 pXz+hr/m7zhXRINRbiZr7kGs9FFtyuPVbtLSBgBC843Rn9mAODHaO0hdiTSCpTcbKpd7
 Ya8OHlxUO18GnfEPa6yJWnYMO1DzOAQQ4oXlz7sK97yyQLJhMLWXA1QhDPf4+5Vma0iP
 9ttQgikbb8sIozdzAvLeuYb1eEJkfV+vVwKJM29x0I1oNsHiFeo8EEGKY1x7iqnDVuof
 jAD3khOSmROLS2Zn4woK1R8qupcVh5QAGFdst1mmbKmIOn5AMvogNMEab6gu5WdWiL61
 8IWw==
X-Gm-Message-State: APjAAAWaq/X5u27zKe1+YlGT57o1RyghwsTcM0k0uXQW4WHvWaMzZlY/
 bYsg6xzDR4IiMZjZDOQg4lS1+HT8673D3+ZUOkfam5aP
X-Google-Smtp-Source: APXvYqzsmR33+2lTm5IxA/V0yfzyT+Fv2XSPDD+RAOba0I9xr9S4m9WpukojBbDznJddTTKYkr9ImEUKsU4VU9JV+dw=
X-Received: by 2002:a05:6830:1e87:: with SMTP id
 n7mr2022667otr.263.1567159118587; 
 Fri, 30 Aug 2019 02:58:38 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 30 Aug 2019 04:58:22 -0500
Message-ID: <CALLMt=o3+h7JpEdyFci7BXzpDyN2XvYvDmxOGLwOxaqn9OneNw@mail.gmail.com>
Subject: stack overflow tag for openbmc questions?
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

As a community, we're getting more and more questions via
IRC, the mailing list, and openbmc github issues. Any thoughts
on creating a stack overflow tag to try and get a more searchable
and consistent location for questions (i.e. openbmc)?

Andrew
