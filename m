Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA6325A52E
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 07:47:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhCdJ1G4WzDqbC
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 15:47:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=O72/0/l9; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhCcR08TszDqbC
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 15:46:43 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id w3so4364303ljo.5
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 22:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WRbh1872771d6vmCXi6NaHjC8BpI5GzKkN+A+PmICl4=;
 b=O72/0/l9TOC+B+a+mFYygSC90FklfE9vjXgvL/oXyz7/MD86r6qqbqrqiTBB5W2hDL
 3RhAOS9NL9+5TcdPfoequQSXquGmGAjEpToRsutgxkXWBfDCLz5mf8Z/O62SVybqG4d7
 NGeZQQMqT3fVc2kXtRWZGR6JbNql687cJZSRfmlQ3RCumbsGhsu4r4pHbvSM9cNsdCk0
 ScRWuJaY0vcvE+74hktZZklZrhNXpYU98/0dLU1d/cCLOm4obLfcpbXkQ9nmmMXhoDg6
 EGNp1PdZebFnGi9iFSCZdW48vRBykTB+xn6lkwYgbG6tvy/rM6KhnlLiDZW+8l5mejwb
 gvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WRbh1872771d6vmCXi6NaHjC8BpI5GzKkN+A+PmICl4=;
 b=PZj/K98v4pUX0nt3eroBhTBPB/e8nY1aT09WtVQDqrfEeXknqKrZtkrBa3BHTMTg67
 8LE5uuXrDHFmhGQelearkLfGs7UCRvK9sxX2vQP/lWgLhVdg2juQXlGUQAkS105TYHyN
 qC+9ZZccDktPvQcMZ62Ncvw+6l9CZ2jk9ugkKbt1aAXaSHmICyvQ0w3705JxXXFS9IVm
 nbj4f192TzJniAQ55CFhMGVL1v9rZvwi84t0y71J4r6NNuaqilAb2iU7/a27BWXVC9z2
 kjCUT1hW7teeiG1lc417bct+O/6gRw2BAZ/NIk1aZkgZxIsDUHyQhf+0I2XUpsYaKIkN
 BN0g==
X-Gm-Message-State: AOAM531dVxVq+NEI2tFrSxw99qSV9G3M903oBUlUpRazPogdhSexn63e
 p9I71t5PTWLGLcwVdKYIp64EATeGTo4hMqSDYKF1TA==
X-Google-Smtp-Source: ABdhPJwDpuBcxgXuiGDZIyWhUey97T2rLz/MWmna+ygYpLtdMm4q//OTl/NTe+yKcLpfGEl2JxSyMXwlcV6bZD8B0CU=
X-Received: by 2002:a2e:b543:: with SMTP id a3mr2445626ljn.19.1599025596371;
 Tue, 01 Sep 2020 22:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein> <20200901164139.GV3532@heinlein>
 <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Wed, 2 Sep 2020 13:46:25 +0800
Message-ID: <CAGm54UFR1rk4F19ucr6N0kS69k405YWa=8XDuaCyLUchKgM-Xg@mail.gmail.com>
Subject: RE: Need update CI build config for new repo smbios-mdr.
To: "Wang, Kuiying" <kuiying.wang@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 2, 2020 at 10:04 AM Wang, Kuiying <kuiying.wang@intel.com> wrote:
>
> Hi Williams,
> The key thing is sdbusplus interface is not match.

The sdbusplus in openbmc-build-scripts always pick the latest one [1],
so I would guess that smbios-mdr is not using the latest sdbusplus.
Could you check that?


[1]: https://github.com/openbmc/openbmc-build-scripts/blob/master/build-unit-test-docker.sh#L54
