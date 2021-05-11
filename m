Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD637AF94
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 21:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfpSs2JzBz3036
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 05:51:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VsAGvERT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=saiallforums@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VsAGvERT; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfpSb27xlz2xtw
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 05:50:52 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id w15so26612120ljo.10
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 12:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=orpMmagSEOjNQwtDGjxtc+GS7OZvCZUuyhb6/5jf5oI=;
 b=VsAGvERTj2Fn43jgC5xHnD3vN6loM9S1Bvq3RdkwSl/piENmjrzcvlmXixocZLoaxe
 77qP2dkY03Cg6iXyLcahn12CRmQUJH0lQtmA56OYhfarSxInQYkiORrT31K0ctYH1lyK
 upWZKWKsRQJ+gWh1oZL4MBam+5uuAfBf6f1OE5d7f5RExL4AsHVGZHwxghn2mbDEJdFM
 4B4hA8nnEuOPwlDOZP98/7pTeTj5XUMiEc1ApC9Qf2PLDxnUKrl2D1cwZSHo/FWOGtTW
 mNHv83CEScjNt2t3mv4Tbg2NBXTja7Hu+1CufJElNInKgscp3zfGg2qL0ej2ff+cS7Vt
 uS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=orpMmagSEOjNQwtDGjxtc+GS7OZvCZUuyhb6/5jf5oI=;
 b=hOaUld6Fa9hD59aOHdMB7w3+xbhxHx2GDKo2nx8h+LEe/5ZI2FKV/6SEXQJJeiUIt6
 S0xHLVvpTd8ZFA2ZAWPu2J9R9NfTAWfNVSC96UiZtkmm3QMqJezGxO3e3F3ecmKhMD+x
 uWCs+MLuE3DvNNInElu9wQ65OjE4jNO9TlNHHS61XEoA4tSvh+39j2I1E93A5CHj8GbS
 D1bHhHPeUH+aPvG1q+KI5yLzF2dvRf6yEDOtj9DryzdbRTRR3NbQU8TaGW+ujQRsPXff
 Mi1rkp8uKLERd21IERPyzgNtAsPBzDQbPIkdl7nkExlB7af7VmOzxka407WPUK6sYi+G
 DpYw==
X-Gm-Message-State: AOAM5335fyjMik+G2hg7nx4CaBReFfdHy52vnSK9gWoWycj45lIFWyVw
 +XQ1297N0/i/eyK5I3iuUO9c0RzT3FycSJ6rdnvC5oFyKnA=
X-Google-Smtp-Source: ABdhPJyIcML0z3eRDkukYubgl7GKwdAFmrH+ZcAM8SvyVPLpVyvep9pY/tmglYIPGWh9KLXYIr+fhCNzIJD5g6n6GUU=
X-Received: by 2002:a2e:9145:: with SMTP id q5mr25077664ljg.400.1620762645037; 
 Tue, 11 May 2021 12:50:45 -0700 (PDT)
MIME-Version: 1.0
From: sainath grandhi <saiallforums@gmail.com>
Date: Tue, 11 May 2021 12:50:34 -0700
Message-ID: <CABqzqi4XL3B6Nv1XqgqvzkXhe25HkUN53+8MEfMY9Acn0Oy43w@mail.gmail.com>
Subject: Advice on delaying de-asserting PCIe reset
To: openbmc@lists.ozlabs.org
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

Hello,
We are potentially facing a scenario where de-asserting the PCIe
PERST# should wait until an endpoint in the PCI hierarchy is ready.
Since the endpoint of interest is an FPGA, it takes "some" time to
come out of reset, boot etc. to be ready and participate in Link
training followed by config space requests from Linux.

So we are checking for options on how we can delay de-asserting PERST#
in the Linux PCIe controller driver, if possible in a standard way.

A simple approach would be to add some time delay or wait for a signal
(via some pin) from the endpoint in the PCIe controller driver before
de-asserting PERST#.
But that would make the change specific to our use-case in an
otherwise generic board controller driver. And maintaining that logic
can become cumbersome.

How does Linux in general support such PCI endpoints to work fine?
Any advice on how to approach this scenario is appreciated.

Thanks
