Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3C3A87E9
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 19:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4FzV0xkTz307R
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 03:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=cRzDmwbq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cRzDmwbq; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Fz96qnBz2yQy
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 03:43:15 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so2304729wms.5
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jun 2021 10:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s2Av7gw0BIbaQFL4b9NJbZPQwXiGyCMakqehy4XfT+U=;
 b=cRzDmwbq7c+ZFIc5qA2mWgoqSCaMBq9kPekfAqBMoCknidGUFQ07+vI/OFTEKg33rm
 OjbGFr1fl8zi0TaND08ETtOeLyQ2XjE1Dn6tjoZW0/OygwDe7hZMXLMYUl5m1XNeWEiU
 m1GsQ6ZPwdORZEx57lBdAmyQxxwmo6FoAQtHzSWlgfrP2A836jjB7Wtuqp7AT0cumE+P
 ZOUKG++4Fcu7p5PCKbuWHLfs0MSgUhKMddLI4FX4o1fAV9RkivEDFTRCQREB57jFPUpC
 lwziqu8FjBS9Kc2D8tREB4CdAD9XCygx5FuVSr3ju9FC7OGgdjGtIQR4t17FWILbj/jb
 ZurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s2Av7gw0BIbaQFL4b9NJbZPQwXiGyCMakqehy4XfT+U=;
 b=eZljDj9od6Ufn0kiXEfgCO590h7tL0epAS8o6kl1l8n17qo+RY9NxEoZKQmCpD73xc
 oBVJq/AExDJt5XGMV6dwsttrFVlBT8eigKTeqXvuIbXXksVVQkWg2NjaZlBbFvksY+IH
 XHKIks/suyaS7s4C+SF/tSEgEBOWASE4RP/i5EjtkJ5d9fHl5EMLRzqGV/URToZFd/me
 dYReV4dND5TsuPJUn5OrjwTzHTb18aZhjeFYFJYzYnA498GF6L8AnrZdk1CH12+mDYlZ
 xTyiiozRXLVr+3XxL15k/ePEa8UkysNhHhnPAIXqyeBWN2SYbIICrS8cV816CVIqE3Cl
 qjbw==
X-Gm-Message-State: AOAM530nianXb0GzmRgucAq2rScwvc/fUu+xWeXqL9hvLDZ5YgemSbvj
 TIMX51nw3pv0JQTFGR7+KFmRnLiMB/qO5ba6UmE/JA==
X-Google-Smtp-Source: ABdhPJyUI7upeJCLMSHBjd3PA1chXkHvtePmhAeUqLb4pgZpjIqdo/KQ3xyQM4MeccDoYZ1KNTusovLGlRCd75x8lIU=
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr6573785wmh.101.1623778986630; 
 Tue, 15 Jun 2021 10:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <8cbf340b-b22e-ea87-05aa-10eac14960b5@linux.ibm.com>
In-Reply-To: <8cbf340b-b22e-ea87-05aa-10eac14960b5@linux.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 15 Jun 2021 10:42:55 -0700
Message-ID: <CAH2-KxC5uhUwLrshxxuRVjqK8d1nP-1yXZp2W1WF-QaLahO3eA@mail.gmail.com>
Subject: Re: Need Redfish API for FieldMode?
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 10:04 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> Network access to the BMC "FieldMode" parameter goes away (along with
> all other non-Redfish REST APIs) when BMCWeb changes its default to
> disable the "rest" option ("BMCWEB_ENABLE_DBUS_REST" feature).  Is
> anyone interested in making FieldMode parameter available from a Redfish
> API? I asked Redfish [How to model BMC FieldMode][].

Do you have a proposal for how this is going to be implemented?

>
> Please reply in the issue or via email if interested.
>
> - Joseph
>
> [How to model BMC FieldMode]:
> https://redfishforum.com/thread/497/model-bmc-fieldmode
>
