Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C68343AC45
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 08:25:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdhdK1G3Lz2y8R
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 17:25:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=psDhDehR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=psDhDehR; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdhcw75MXz2xWx
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 17:24:46 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id n7so14146150ljp.5
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 23:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CCbB+cQuV9ZJPcYyEC82ek4t7OlALxtZlZzf7mIIkT0=;
 b=psDhDehRGBdgDFWzhWDoiiNph1oRGRi+leq8XX9P8bysDz6tCwkKT9dQUFWX5IgE6H
 Gm7pWVejfeT1uQ41HXDV124I6+ouVySIe7KIZkAGKiCSYNiyPknje1FgJzrzQEq+U6ET
 TOUdBz63/BQ0uhixOBz3CAO7zk798GtSZ1Q51d/DZ60PuRO1RHLUkxqAmDx1pIfJj9wh
 FbGeYNFz4Q/INv8WmBXaWcpOmFsqL/Qbv9Zt0uUSzLlYylWR01o1YSNzhw2Cz8ZKi625
 GR+207kH8KAIK+O7SxqWcCP4/sbIQDg2k+eLoNCj6hXESZRR3uoHw0J3XxiCmccFoiBV
 WLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CCbB+cQuV9ZJPcYyEC82ek4t7OlALxtZlZzf7mIIkT0=;
 b=UqNSxeTA+VyM1htc7advzD3K6R9YuraXKWKu9YB7SZ/VGWhOHsosEr7lXRQ9D23lVH
 1pDdmQ5aMBYM6sISFoibB2QXqRfoIl5FuVira8AHUIkyLRLBL7Rm4tqYukm9XIyuQv2J
 VImqxiFAn6KsJYxJD+OtzljJTwRBl8qIoNQErr5jj27L6rgY3ILwj06xbgqgNWkBhdnh
 Pd1BNQBYrZDd2S+whVFL+iQEUwHzeudZPwF2L5nMFunczWsKkQqPzVDUj6Ov7A3l+aam
 lqpIRNIgZWWv+VcCkYQPF6VtVBrnc1EVqSBvuyluRYtml9fdmFZI/bsBq40hB5Y7J7OH
 Ud1Q==
X-Gm-Message-State: AOAM530BKtwHRwwJQ2GAn4FyW6dFwZwsERNTZkaaAjtdmjMIn784AauW
 UZYTERTH9bMIP5TYlyTeHX/RzALFxQxM09ljY+I=
X-Google-Smtp-Source: ABdhPJxrFTvzsj1sF8Qyo8BQLtvSJ5NVR06yvPN8J0qQREUC72SHkuhG5vqJdUE4/7lEi41U6WYLeoQEqIoGsMtn3XE=
X-Received: by 2002:a2e:5c04:: with SMTP id q4mr24424654ljb.250.1635229476230; 
 Mon, 25 Oct 2021 23:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514939D6512525765C3EE23DC839@DM6PR08MB5514.namprd08.prod.outlook.com>
 <a9ae1f74-e48e-f266-7e88-5b2ad27cf7fe@linux.intel.com>
 <CAGm54UHh2CUhvRSD4fKzTgbqZENPVfzesvxcK0Gxd4QtGQ1nVw@mail.gmail.com>
 <DM6PR08MB55145AC2D3451DF2CF042092DC849@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB55145AC2D3451DF2CF042092DC849@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 26 Oct 2021 14:24:25 +0800
Message-ID: <CAARXrtmF9KVYyB-qN7AGhEuvT6dAaUcz9wwr-Oy7kfyW6tFPeA@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: [phosphor-sel-logger] How to add a
 journal entry manually
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 Lei Yu <yulei.sh@bytedance.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 26, 2021 at 2:16 PM Chris Chen (TPI) <Chris.Chen3@flex.com> wro=
te:
>
> Hi Jason and Lei Yu,
>
> Thanks for your sharing.
>
> I am able to see the sel in the /var/log/ipmi_sel as same as Jason mentio=
ned and also see the sel by the "ipmitool sel list" command.
>
> However, for Lei's suggestion of adding "send-to-logger" configuration, I=
 really can see it becomes an entry in /xyz/openbmc_project/logging/entry/X=
 rather than saving the message in the /var/log/ipmi_sel, but I can't see a=
ny sel entry by the "ipmitool sel list" command. It looks like the ipmid do=
esn't parse the entry into an SEL record. Is it the sel entry I added (busc=
tl call xyz.openbmc_project.Logging.IPMI /xyz/openbmc_project/Logging/IPMI =
xyz.openbmc_project.Logging.IPMI IpmiSelAdd ssaybq "helloworld" "/xyz/openb=
mc_project/Test" 3 16 32 64 true 0x81) just a sample not a formal info? or =
due to other reasons?

It depends on the config of ipmid. You may be using the dynamic sensor
feature (FEATURE_DYNAMIC_SENSORS), which does not work with the above
case.
To make ipmid work with the logging entry -> SEL parsing, you need to
use the static sensors defined by yaml config, and then the code will
parse the logging entry into a SEL record.
