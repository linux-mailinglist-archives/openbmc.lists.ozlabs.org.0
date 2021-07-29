Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCF13D9EFC
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 09:49:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb2jj5SNxz2ymN
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 17:49:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nc2Bn3RC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nc2Bn3RC; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb2jQ5YXXz2xZL
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 17:49:13 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id h14so9261664lfv.7
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 00:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LfC4LA3SuQ0GURoQo+FclXIIeCA6cGTwQ+fMe8R9dFU=;
 b=nc2Bn3RCLrzmLsOhZbHUErH1E7PGQP4K4O2zDmVdNNUy3Kwl6xn8LnZ7/VoS5AMaRN
 2OBHyVlL2Th7ejWLjCa09Xe2Tj67SbffpUEtZKc+wpRcByQ5jyZRn/kJtnMMq6okaYfx
 N4xk8QaaVPovJxnvBMk0tcHl7PPKORQw1WzwJQ5HReVoLOz5xFY4+KX+1fmL50tIcsa8
 kj2MF3PvRmWaKV7xn1H1WhLUnL+4+waTgquDE6hAB4SO9+TaB/50YrYDNIMC7bhXDLzL
 c5pGwzKP5AdgB1qQvb51WhSCQYx8fWhDy6uFsDODanmJbZ9nphiizp2d/DO5Js/9rk6L
 MW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LfC4LA3SuQ0GURoQo+FclXIIeCA6cGTwQ+fMe8R9dFU=;
 b=QrWGwemd/t93j19josTzCuab8OSnVGRsQGXOP5DdKE264/+tuBvUr0TLqpe+CuILsZ
 6OHJgVt0HievDpCuFf/zfECrgMXT6qKm9DSTAb9FU45zresEq7tH9KyuSEowToyJNyRe
 GQT4/fzuZj4HonmfJGrTc55Um/E8e9qBCeEVKJtW1RHs6AWt6gWA9NxJS/nFNG3clWBD
 cKp2K/bPZ03pNUXFD5Hn++qzN2qYcqKBo9yd6L7uj3A38y4WATD9A0KLIdGI9UMITGJ0
 2IHGIoIKap10kn1Hscb1Su0ndTiNywX/mL+xlQrIEiVWvNXWDnzSKVDB2ESa0hy7Bctt
 npMg==
X-Gm-Message-State: AOAM533nRz80nFw9iF7mnRGrG9hVrnUbMGAAm5gHo7X4x3q+t4rYCeYg
 uHlTAk7DeJxv7qhPp/YV+eE=
X-Google-Smtp-Source: ABdhPJzJ0gjTZ1LdQWZw8PumhvEJ7bo7ErHdvrDUnpk5maf9VTzPYA/X0I+fuWzeBrsgnfh9Ei+92Q==
X-Received: by 2002:ac2:5f46:: with SMTP id 6mr745864lfz.381.1627544947461;
 Thu, 29 Jul 2021 00:49:07 -0700 (PDT)
Received: from gmail.com (109-252-117-107.nat.spd-mgts.ru. [109.252.117.107])
 by smtp.gmail.com with ESMTPSA id
 t16sm108728ljh.13.2021.07.29.00.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:49:06 -0700 (PDT)
Date: Thu, 29 Jul 2021 10:49:04 +0300
From: Artem Senichev <artemsen@gmail.com>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
Subject: Re: Leveraging and extending smbios-mdr
Message-ID: <20210729074904.u5lnr33pvayp2r6z@gmail.com>
References: <DF4PR8401MB0634147E668CC84648DC883A8FE99@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF4PR8401MB0634147E668CC84648DC883A8FE99@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Pedrana,
 Nick" <allan.nic.pedrana@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 27, 2021 at 03:47:04PM +0000, Garrett, Mike (HPE Server Firmware) wrote:
> Hello Artem and all,
> 
> We are integrating smbios-mdr into our build.  Our SMBIOS info is downloaded and built as a file in the filesystem using proprietary means (our CHIF - channel interface).  Our hope is that we can simply point the smbios-mdr service at it and light up new information about the platform in dbus, Redfish, and the GUI.
> 
> However, I can't find much in the way of documentation about smbios-mdr.

If we are talking about the MDR2 project (https://github.com/Intel-BMC/mdrv2),
there is no documentation, but I don't think we really need it.
It is just a SMBIOS dump parser for some table types (CPU, DIMM).
The table format is fully documented in the SMBIOS specification:
https://www.dmtf.org/standards/smbios

> I'm especially interested in how to extend the functionality past just CPUs and DIMMs into things like OEM records supplied by the BIOS.

What about phosphor-inventory-manager?

> Seems like the possibilities are:
> 
> 1. Smbios-mdr has a generic dbus API and we write an independent service to query it for this info and publish to dbus
> 2. We create a generic extension mechanism for smbios-mdr for vendors to add OEM support and push to dbus directly from smbios-mdr (like w/ CPUs/DIMMs)
> 3. We fork smbios-mdr and extend it (not preferred).
> 
> I'd like to hear how best to leverage this recipe.

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
