Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E350C968C2
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 20:49:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CfwM4vDBzDr1f
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 04:49:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="u95xtIZ3"; 
 dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cfvh1298zDr1C
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 04:48:45 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id c2so3185890plz.13
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 11:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=q5+vlrEIyaUuPS6l7Pr40gqs5FR9a4YEGk5Jy1X0oLU=;
 b=u95xtIZ3/M3qSC3C6eVWmN2iAef5BEqATsiLrh+MHa7OxSipH5pB0AgXfKJI8xlPJ6
 6Luv1ZbNGDzOSXN+bckEhCZloIQJzmp+iOLsL+vps+yiPGcEm6gz5jzNHdjoPbU6CntP
 WeYjgIy0eRP/dLG9SYDf0D7mixBzonvW1LMLsYF8uQ7X2o03x1HTiMyCTq0JKRL5qFBo
 9dqDl/ACKLG3asV4E8fc74rekHfvlFB4iOuijb9s1UUW/hYyIBfC7t4CwJzvEiZypscn
 rlqs7RZ6Wj+vVP5LONrLC9T7DpFLdMxCWRYz3zoHVhYB/6uewmldJ6FnrQ7brKLYi/xD
 ii0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=q5+vlrEIyaUuPS6l7Pr40gqs5FR9a4YEGk5Jy1X0oLU=;
 b=kVx6miWi+PzS6X8J5mR7vW4i1DutNovf6XfzwGMmBO6v2r1kIWJjYQ82QDmfa438L2
 AZZ34vQKtsz3I9uLP+JTPlOEqo402cXE0nEZApfenPGdlliTUvS10Cq4DTZz2mDbGe7G
 rIG1XWcEtKSp6qC1FUFyLPd0B0GG3DO4g8jdrFaLSTrfoM/Dp+83SCGUNEe/5yO7BtF3
 gl4AXu6hKCR6rxij+RzGspGP4ebfMdRRAUHnwP6HSXwYlIn73GNqLrFllP5hC2CQW+n6
 WeH8y2vyXXuXiu8ZCa7SXioKwJLy0HrXhPuZrZufKPu4VPGNpHnoyIW36zJYrQrjfnlT
 BoDg==
X-Gm-Message-State: APjAAAX/qFYM75vlDryw5rjC9gC62rX4wQSJZ/aAZoFryR9dDjcFiNVe
 B8cTp74Mnm8qJGPMc5AW34cKLVINN4lT3uMyl4qMug==
X-Google-Smtp-Source: APXvYqz28l7DUiCsjmHwRqSqOfXgLUAfEfmeawQHDQSMIYwfYIXkc2YabrZaUEBn0+HjUEcZrCOUsmDBgJjf1p4XOTQ=
X-Received: by 2002:a17:902:e311:: with SMTP id
 cg17mr28588113plb.183.1566326920928; 
 Tue, 20 Aug 2019 11:48:40 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 20 Aug 2019 11:48:29 -0700
Message-ID: <CAO=notz7QgiHq-B3Sw0F89YzxK__CuLvn+1DRwwYFoPK-3r5Aw@mail.gmail.com>
Subject: phosphor-ipmi-host sane entity map
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomjoseph@in.ibm.com, 
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>
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

With:
https://github.com/openbmc/meta-phosphor/commit/fe88ee4211c93f4ca4acba5ecec502aef17944ce#diff-0838b00f3d431ade72af266d179a3e70

How did you derive the entity record?  I ask because I'm replacing
this with json:
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/24552

And wanted to know if I should use the file you dropped in, or leave it empty?

Patrick
