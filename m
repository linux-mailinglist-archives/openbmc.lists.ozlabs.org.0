Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6DE50D7CD
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 05:45:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmrX52PNLz3bf9
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 13:45:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=IYdjKTb1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=IYdjKTb1; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmrWf5fCgz2xnC
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2022 13:45:32 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id z8so15810684oix.3
 for <openbmc@lists.ozlabs.org>; Sun, 24 Apr 2022 20:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=DtjKnfm9TPtUms9ow6dqngreqcciNH9j0wrkC0SfTNE=;
 b=IYdjKTb10aUC5+F2uCf7f019OYFVAKgKAjUhIAoOuFlkMBmyK4m8j3UZbhLy2xiPCG
 eUt8lz/f0MLTXNIfvDTmfNV8vkLLYmXuc9ZJMGbiS5X848lEq9RV1NOEXg0/lCCi6Jsm
 AScBhS0moX7xA3DY8KCSPWWEqo97hHs670khxGbdcnKWVkqr2HlU2LGnChYUbMIKlNgu
 TSxnHA0HNBGTG/omNbpnmVWSjN0W4T8/g45sWmdAZt+bnnyY2TWzZkwBJD20QTY6U3tD
 NM9s6JAww4+FoNsJQQAmAPj+YaGucFdFdCkR9xE5bhqwK9vG1OIEGIfqNeYqB5poYmxH
 7Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DtjKnfm9TPtUms9ow6dqngreqcciNH9j0wrkC0SfTNE=;
 b=DEOVP/FQl8KwqfwN8xG5hDTt2R2hyoyz1kLeOLtJHKHneXrjDgqyu8udGxUdq0qF98
 aqGLIeG/5O9nQIVaJoK/Ul39YF+fmJNegKiXbx5EhSnhG9RolpIhE4RkVmvDlYo0Byo7
 13wOqaSkGWyicv3MiSD/CkphstkcVbwuWhMO4/FbbAqLbJL55F5eMHY1g5Dmc37sBgrJ
 b2tQaEX+UwbTFSM4N7l0npg++9yINFIaQTRJIdbKZB4xJOzwZtRMJXt2iKM+BbnF48rJ
 gy3xf05oRkeoFqUqHuTL/dvGxjM+Rk5l/ThmE9jA7JGgvTToiGOx8fM9N0g0fDH31F24
 k7AA==
X-Gm-Message-State: AOAM530SlH4QkZ/z2mE8pxc6E1q5yMV/NN1bPr2ilsgH0w32JRG5GUl1
 1HJEfQuBFZpQZ1W5BN2JZUtYiXvlsbr2gctKc8A421wRJLHPTYE1
X-Google-Smtp-Source: ABdhPJwADjEGXdLF18dc0R7v9pK6Z79IWufZig/NiooRcaCEkkuJJ8/yO9mNQgipRua1ZMXkbJi3tdlj2S67M8t9Q8I=
X-Received: by 2002:a05:6808:180c:b0:322:3d43:c38b with SMTP id
 bh12-20020a056808180c00b003223d43c38bmr11232832oib.8.1650858328911; Sun, 24
 Apr 2022 20:45:28 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 25 Apr 2022 11:46:04 +0800
Message-ID: <CAGm54UH2PyScL2LnUejc5UcxSh51xpRYC-8krYz+3aPoi0iEPA@mail.gmail.com>
Subject: Introduce .clang-tidy-ignore
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

When running clang-tidy on repo CI, there are cases where we want to
ignore specific files or directories, e.g. ignore the generated files
by sdbusplus, the files in the unit test directory, etc.

This mail is to introduce the way to add .clang-tidy-ignore to make
clang-tidy ignore the specific files.

In this [patch][1], the unit-test.py is added some logic to check the
.clang-tidy-ignore, use `git ls-files` to filter the .c/.cpp/.cc
files, and filter out the files in .clang-tidy-ignore, and pass the
result list to `run-clang-tidy`, then only the necessary files are
passed to the clang-tidy.

Please have a review. (And I would say clang-tidy is really a good
tool that does find bugs in the code :)

[1]: https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/53234

-- 
BRs,
Lei YU
