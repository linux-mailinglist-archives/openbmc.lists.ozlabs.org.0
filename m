Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE942FCA21
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 05:54:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLCqc3T9QzDqfK
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 15:54:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::930;
 helo=mail-ua1-x930.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jIOCcF54; dkim-atps=neutral
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLCpk3YJwzDqG0
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 15:53:49 +1100 (AEDT)
Received: by mail-ua1-x930.google.com with SMTP id 43so4951256uag.12
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 20:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odJFmowESTbUTpNChYS0XYON1ANjXketGDL0XcgX44Q=;
 b=jIOCcF54uOs37UM+aKFThfutxF91J3mpvqP3HXeA4t5z1V2AAXeVIWf5cq637NP1vJ
 gk9nWFjGmzT7HaPpqxElUfh0d011vpBadhe1LUHHKNwcVdUdg3Wzhq0Ys9DgdWvP0YHl
 nz3uFBXOmS8zZXFTAlvhpogKnksc4ly2/rSfxOYDIC31uWzkTnTJVK9bvjA7fwnyuUWK
 lF2J69YoaLuwel2dD7kMF8Di0aeUr8wwDKZtFQsFdJIGV/bZqPNDMTm0wtJz4K3cVmGZ
 qurf9Hl+DDDhPh7Ue2Yg6OKcaAywPw21lsdLE+SCpgJhWJa3A3X6Qd3VAFK3KatyzSLC
 rzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odJFmowESTbUTpNChYS0XYON1ANjXketGDL0XcgX44Q=;
 b=dcVAMrhZ3OPbBmKFV6prU6iLVGTdUbJpwg87xxQOIkJv/H//EEV2xZwzRQYfAz5HCo
 5Pi9J8FxCqUnaMfSY2FA7sldI55Pg5rbLjN+JsHdPHsSKo+4OrQIHcwnkv+DGNmDhdwx
 BtykpSFV6NUcSkhYCWJN7Tb48CGAs0/bUuP329qf/cf31AdtoYbY4XAf+vV9Ns8mISeM
 deveUeHGk8BJjbEsl4gXrBhxFbOTLgXL1SmLrDy5Vp4NQvaO7aXd+/9WKGf3qDxSjhnC
 yZvlsZvzuTJda7BNSCqQrmlFCbP69VgJqFA+9y6b2kosSF1lYN+IILEpWisQ+k9jQQvM
 rUBQ==
X-Gm-Message-State: AOAM5320+WG9zyRO8QjUEb2HqgtMY++kk0Y/RKCEwEwH32prfZanezQI
 sT6hTJLpO1wdfkrrfxahhRJrMM3szYtibLYTPXg=
X-Google-Smtp-Source: ABdhPJzH7LTnlavbmvtpYyk0MKlGY63i1knzx2gtqUAuT8ipzvHJaOhkjSXpfQ9q5pM09eBjGSnFSOV4d9SUEMxXEDI=
X-Received: by 2002:ab0:4ac3:: with SMTP id t3mr5076945uae.34.1611118426375;
 Tue, 19 Jan 2021 20:53:46 -0800 (PST)
MIME-Version: 1.0
References: <3475dcc0-5630-b18d-5cbe-e36ba1454fc4@linux.vnet.ibm.com>
 <d1511a78-6a2d-4709-9839-fc7413c64a92@linux.vnet.ibm.com>
In-Reply-To: <d1511a78-6a2d-4709-9839-fc7413c64a92@linux.vnet.ibm.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Wed, 20 Jan 2021 10:23:35 +0530
Message-ID: <CAM=TmwWkokfJMdT-Vd88SSui4ee7jYPudMmRXPo0uPO=6bCY4Q@mail.gmail.com>
Subject: Re: Switch SensorCollection to show all sensors as new power/thermal
 schemas implemented
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
 Ed Tanous <ed@tanous.net>, Lei Yu <yulei.sh@bytedance.com>, "Li,
 Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Gunnar,

On Tue, Jan 19, 2021 at 11:51 PM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> On 1/11/2021 11:19 AM, Gunnar Mills wrote:
> Based on that reply, I propose we move Redfish SensorCollection to show
> all sensors. Let me know if anyone objects.

Where would the sensor collection be rooted at?
/redfish/v1/chassis/{ID}/sensors? If so, would this also contain
sensors accessible to the system software (some CPU/DIMM sensors for
eg)?

Thanks,
Deepak
