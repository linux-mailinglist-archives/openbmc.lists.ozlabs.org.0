Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6C26D0B4
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 03:34:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsKJb1XThzF1p4
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:34:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=209.85.210.47;
 helo=mail-ot1-f47.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsKD62836zDqZP
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 11:30:46 +1000 (AEST)
Received: by mail-ot1-f47.google.com with SMTP id y5so409831otg.5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8/7ZSRm2phB92VYFHb7GAffChPJbZ60FFod12CQkVms=;
 b=UxTdkbktbr+s2MCA0I632ygCxTYGiX/CI1091mMjYxlDMA8ffb5K9V2iK17wQPA1D/
 hzemson03offpBfObLQESYw0nx7ukwvvQ305+xPGD3qtQaPkRms61wqm8oDVYjoa4Vat
 YB2+UofxHOIJ6UeEuOThRJv387qPUdtnxysj4VEQYyN871U9OGI0DxrkZkn/bOTd+/ev
 swfJGh/rfddKfKj9WGrYpJnSj6PsQO4usk0AdJMchC/wl5IQqjOwY4+bVZrim+pOwqec
 g3x/ddlulRMznljTPUj+J1cFj+hknn76wN/owLOtjHtBGw4IgStelD7jlO1afDKP52mw
 Wr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8/7ZSRm2phB92VYFHb7GAffChPJbZ60FFod12CQkVms=;
 b=T/JLE6V46ywC805zn82qdZnLLn503CdU72YxoOcplYOaqK78Y7xAQ4UE9+JXuUtd5+
 +ip0pcT2AE/KkRvri1qxhV8/J2C8pJ/ffGyLBbRimdO4Hx46nT51QqFbrEFeCe0OVmEH
 3YVJhDTm9aCX7XrUD5xJ44cguWSdj9fFRzku71ZSITgM3XMkX+ioozXuNm0bY5OCcVkI
 wzk61XI+sdXsVXOF3r9b8/hvAbFYeoBtr4BLUmkyjsySEuxFPhin54rKp8ECUwJ8n7eh
 WkJvx3K0Tcmf+UrIpTuPNXC23AjFMZUVX84plhPiATwqgXSTNT8FTkdKr96HDGCEBSYp
 VCJw==
X-Gm-Message-State: AOAM531dzjaNdX4wwwaYHVMtevteynS3sTm6qZZ9XuoJ4BZdJqTVP85E
 iWtn+YZutmXtGz8NELx2bgCER/NzQ5xefGw8NGGblG0GWMgRWw==
X-Google-Smtp-Source: ABdhPJyuwRdKv886ChvqXuPg7+oyq4OJfhIE1/vfhjRSkHU586ApSw822gDzi+etd9FQ3PUsql1ubCTo36nkJqrXgQk=
X-Received: by 2002:a25:cb88:: with SMTP id
 b130mr30191334ybg.521.1600291239081; 
 Wed, 16 Sep 2020 14:20:39 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 16 Sep 2020 14:20:02 -0700
Message-ID: <CADfYTpF8sRiFN_vaA3vkXNrvTK1AWjoL2inZPEYPF4oP3oaMhg@mail.gmail.com>
Subject: OSFC 2020 Submissions due 10/1
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

OSFC will be virtual this year, Dec 1-3.  There aren't official tracks
this year but in lieu of an OpenBMC hackathon, it would be great to
see OpenBMC participation.

Submissions are due 10/1.  Details can be found @
https://cfp.osfc.io/osfc2020/cfp.

Tickets are available for purchase @ https://hopin.to/events/osfc-2020

Please give some thought to what you might present!

----------
Nancy
