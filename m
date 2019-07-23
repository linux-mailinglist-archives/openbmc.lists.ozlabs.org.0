Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AB72598
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 05:53:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thKP6Yq3zDqKJ
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 13:53:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="f0kGYyQ7"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tLH64wNxzDq5f
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 00:20:32 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id y15so19231745pfn.5
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 07:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eze1oRfyL6tSpejjWzyAnu8VCtdQRN1XjOkeWbSyQKU=;
 b=f0kGYyQ7W1tzG51n8LKfkhEUxpGExuFADXGEOmZ0prpiz4T/QJ4AofW9U94oL88ICR
 K8nimuEUt/r+dP2hL4zagJeX0QGAQB93nXE4B1VBLy0uK5dUsjPQe2RraK+9/7cJNkI/
 G4oiE4yeN9mW0OaRw9nfJqoyBx+gVQV1IwCdvrvgcaaGdMeCklHZbOzVcfSACz1JQLYe
 PFxL1U4c+CBznVlh4aweMzeYxWI63eFPOi57ubk8NXdeFTlRP6vj92EpPaY50nmKCDLw
 V3SeKCzgT2qqAQcShtWJ+p1muZLAslgflGVxk72Kx6rLpoA3JkOKg9dIDICtohhATQ6v
 Bj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eze1oRfyL6tSpejjWzyAnu8VCtdQRN1XjOkeWbSyQKU=;
 b=baMZONWmdkzzIS+h754thEDFncIdpeVpE8oyUN8C6SJRUEMtTUX7e/FlZMMI2j4vdY
 0ZICHKCqEzDD4nQmW1CyI1rH9Ow981Ql+mMnkwgF/LdPRcukh6ueuoYUIejYuL+O4ajh
 yHYN3PGDhVfZkkSmiIqNjzXCGT+RXE/81Ta0uXxt8M+TakmBTXj/+VFo0ZExIwbOMfzK
 emK/fJ0+cNcaGF8nGN3WTSIh62ifFfHwExnLf9lNFzS17YenudYNzfi+dcOQ864w0935
 EWgn1IF9a0KtdEWLp0cH0oWRrMKBdnMMJcBIZq+KctrcTnHURgkNs2QVWHFphtAC3WpQ
 OVkQ==
X-Gm-Message-State: APjAAAWQb4SSZCWKMd++SWoB+WcZ8FYtCzYlqk79Livo9oZdZ2o3a7dy
 y/mlMANWTtqjoYiMskVt6M7HOJSQiC/c5Z+xny2KmA==
X-Google-Smtp-Source: APXvYqyPhJcVYTzW6gKppR1xJHUDWIix9DpMFeiN1HKferExwR8So5FYESa6Q2ALkxgzBNxKCeaySi1I6yjmW7rqkqE=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr75871209pgf.353.1563891626406; 
 Tue, 23 Jul 2019 07:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwpKm8KLiXbL_+02DLUsvjjZqAPBCujnTLCd8GnheQQvA@mail.gmail.com>
 <CADKL2t4DztiWaWDFpYK_iHqyJxxk2+dgOhGTgayT2uUPVqGcKg@mail.gmail.com>
In-Reply-To: <CADKL2t4DztiWaWDFpYK_iHqyJxxk2+dgOhGTgayT2uUPVqGcKg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 23 Jul 2019 07:20:15 -0700
Message-ID: <CAO=notz0U8o-29JAy2_bJYCO4Sp_8ii3KZ4r88Y=QFwWTZd6-A@mail.gmail.com>
Subject: Re: ipmi-fru-parser + entity-manager
To: Benjamin Fair <benjaminfair@google.com>
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
Cc: Ofer Yehielli <ofery@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>, James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 6:34 PM Benjamin Fair <benjaminfair@google.com> wrote:
>
> On Mon, Jul 22, 2019 at 3:25 PM Patrick Venture <venture@google.com> wrote:
> >
> > Does entity-manager manage the FRU eeprom devices?  Or does one still
> > need to configure ipmi-fru-parser, etc?
> >
> > Patrick
>
> There is a FRU parser shipped with entity-manager which searches for
> FRU EEPROMs and attempts to read them:
> https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp

I saw that, but is that a replacement for the support provided by
ipmi-fru-parser?  I'm assuming yes, I just want an authoritative,
"yes, you get this and don't worry about ipmi-fru-parser when using
entity-manager."
