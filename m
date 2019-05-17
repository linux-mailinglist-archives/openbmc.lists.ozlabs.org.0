Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6221D4D
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 20:31:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455H0z0LF9zDqTG
	for <lists+openbmc@lfdr.de>; Sat, 18 May 2019 04:30:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AjTGLA2N"; 
 dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455H0T5wJJzDqS3
 for <openbmc@lists.ozlabs.org>; Sat, 18 May 2019 04:30:33 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 198so7801262wme.3
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 11:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P7oFyAuGjwcGtqn5R4QNIZH0NLHtHigrm0CAzpmFrl0=;
 b=AjTGLA2NhlVt0ScP0LfCdWEoZ67yBBQZU7fkR+hmyHsWnw32POqMhaHymK1sPZExVy
 slLqjEPjqC23GoXGm9H1ffULK5DCayOnjJAR1ONgO74RcP7+xuBJmqkgs/jQ0gSxu6gT
 d97rZx1GbDXP5Rev/dGcFMCJQQOU2qcYDAlzv2aBJxkwf35tLo4nkh8PLrqQrgQzEMam
 bp5xPVPgyUm2ZoBkoe+LbaceFRqsr+YWmh8ilQ8qXxwZWkX1HzGTKcCDxV9W/pdtNNhm
 ZWD6+I/Bbd94A1sJZehnSkemGmL5UHKMVhOPjn7w3oWU94gLDzJAgYyiQjO9CGNMz+jI
 oUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P7oFyAuGjwcGtqn5R4QNIZH0NLHtHigrm0CAzpmFrl0=;
 b=M2KZYZP7pSCNDlB75pPlDgqRn3efPqlb/WxebuBQtFwTdn2hKzpuSJqjKH4e9sNX8C
 AMvScKK/ztnqwR2r5M2HqBWag1WYhq6tvLoKW/Sa0TVxzHInexvLE8alozSB9u6Jigvv
 XxXHis29yglD1hnkibheH1GU4Ez2imefzfzjLjb+lOchfY4kLLPSBySW7YnXhWOLmqUd
 NIE1MQd030kAUtoUHCpUWnbh016yMU7SwleTNapwsyNlgLnu6XmgUiGWMLPXU58HWCDf
 5mt1GfPru5e+11+6M7BX/kEOVXOI5U8KjwwV+cL1wqLfB7ZSkJak7Mk9/twxvW2TfsEP
 ETOQ==
X-Gm-Message-State: APjAAAV79tndyfKWIAylxTU11lKbkh01CHrhlW8TlnqGw8Ee+Egbog6R
 kY/A+SQDuerHDXe1LReVUikAJ+BgaIrtKJNgqCM=
X-Google-Smtp-Source: APXvYqzuCjeGvjZUkFg8/Tmk8J0QLP9DIF9b7kEEoFfQSjWb4NchogykiYvy9ZSFgIJH/dKW19/VuGb5OIKxCDPq0ew=
X-Received: by 2002:a1c:760f:: with SMTP id r15mr19691461wmc.134.1558117829190; 
 Fri, 17 May 2019 11:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cDx5rw50zK0WnF20PqFFU_pGdDZ1fvk15PASeGeKsH-+w@mail.gmail.com>
 <19be2af8-7b88-5183-44c1-d27fddec29c3@intel.com>
In-Reply-To: <19be2af8-7b88-5183-44c1-d27fddec29c3@intel.com>
From: Derick <derick.montague@gmail.com>
Date: Fri, 17 May 2019 13:30:17 -0500
Message-ID: <CAOUmYFSSzi3Mo7YUh6-rvdJtNj1Bp2BG6+hV8AzMS3SHt9xWRw@mail.gmail.com>
Subject: Re: [phosphor-webui] Enable style-src 'unsafe-inline'
To: Ed Tanous <ed.tanous@intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Henbin Chang <henbinchang@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>  We would like to use angular-ui-grid module to support grid feature.

Using a system that inlines that code makes maintenance extremely
hard. Using inline styles creates specificity issues and is goes
against best practices. I am assuming you are referring to
http://ui-grid.info/? Like Ed, I would also like to understand the use
case and why that is needed.
