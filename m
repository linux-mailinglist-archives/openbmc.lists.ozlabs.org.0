Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAC98A30F
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 18:11:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466gnf5px9zDqLv
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 02:11:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CDvTUp7z"; 
 dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466gmq3h3vzDq9b
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 02:10:32 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id a93so47999928pla.7
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 09:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pQp8odMmDkYOZlEeCRmJOBd0zVpW4JSqcqvf3bRBSZE=;
 b=CDvTUp7zl1ucjQCTWcxf5X+/2a8p8LNGs2FhUdbnujjXgURHJhTqGNFu7otERRFtvD
 m041Te+M8EjZzsi3OvGS5AYxny0EfUdEzY7tWBFs18rt5AAmPcG11Uw08sYOZnqbjGRA
 5uen6+lkTg8rXW7vGldRLcvYW8KDy5WHnncxGmOO22dAEhKPexNFwSAdnlb5if75yLjU
 QFl333reEyVNim2GlBNlWZ+JKDnDvbJ4WkXFhXuoFAiV4Y0SYarEWKce7a0K6AYwGxPu
 DVO5e5Ty0og5vEkGNKkqphN2+02PkbPXBDYxcfbTHJ6qVsX/XeF8lLg4SqiZrxgL+sAK
 MIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pQp8odMmDkYOZlEeCRmJOBd0zVpW4JSqcqvf3bRBSZE=;
 b=aVu2juWgpcmTj6Xx+e+j8gqfOPTqDjRJ7s+w10Qs4dxkR6yzVugMzKQgnHJXMp8h9U
 rJNajVTD8/x5BsLoWC16ZcbI6hjByKhPMP11oC3qUWyLXEqJ0Zrnib++3gxkupGeAs54
 Al4mJKxNHWpJ0LOrHoqRz2xrvh5HdEbrFwzsRhx9BqTNMVwsNF+1CMMrKj2KHqBVlULf
 13j6Ls5oPdwffjk5WBeeA2aOUzr5ZKhT2n8jNjXgK3QHoaAG2+iwxRDZ6yMkMXkXWFHG
 p68UiCUIvM/G50s3HC4McBdZ6yYrkqDLsbWvk5SD1nKuHKCZkOJv43U9I5+uXsAeALsQ
 TE8w==
X-Gm-Message-State: APjAAAW1IxE04vyGmuQPNtKeC3fPQvqQo1afQahZKg5Frq78n60A9bxq
 HnPqvf+X449UmQJ2nB3z0CC0+EP02Vhfmqppo0xuxQ==
X-Google-Smtp-Source: APXvYqzJCwG4wBtiu3JZaoe1/mmJbOZhD39I7I8CO/+y659jBFH1FMcDON6OJQpuAQutdae25uzr1nDydBVkyTpVMZ8=
X-Received: by 2002:a17:902:a9c3:: with SMTP id
 b3mr2627358plr.179.1565626230678; 
 Mon, 12 Aug 2019 09:10:30 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 12 Aug 2019 09:10:19 -0700
Message-ID: <CAO=notykGFd7Ux3k6OcsskrKTAxLa=vEiybFD3agPuqkGoYG-Q@mail.gmail.com>
Subject: template replacement
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I've run into an issue and before I submitted a patch to solve my
specific problem, I wanted to get a sense of what was intended:

I have a field "name" that I want to set dynamically to "$bus_v2345_0_local"
It finds the $bus match but then fails on the split.
If I add a " " it then fails as well.

It seems to be that if a template is at the end of the field, it works
fine, otherwise it assumes there must be some operation to perform.

Did you already have a fix in mind?

Patrick
