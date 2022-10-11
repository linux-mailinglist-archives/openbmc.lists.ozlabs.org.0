Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 456675FB036
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 12:11:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mms4X1CPDz3c4h
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 21:11:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JVbFVUvx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JVbFVUvx;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mms3v2rzqz3bjd
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 21:10:34 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id bu25so20377929lfb.3
        for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RUBENAjQkfGkLEtSKfpJY1z2C5TtT9NMRbBfM1GXBE=;
        b=JVbFVUvxH0HTdzOjxX+DwJTfyMA5MXLtGChlO7LOaPWD/FB6vKlHSCSc10FlH2J/j9
         bHahX1Ofe7yikQ9o3znELiL8wc61cGQ9CGyEEJIHtA3B/HxFVmTKhfdVYCPU3EIjV6Pa
         nqpL3BQwBpQS6HjenIXh6Pv19BckGhINh2nGTfGAHejPg0JUB+T02TKpylW0jiNVB07T
         xLdZu9OGhwiq1/xd+e5koCq6OWAxFhC+CvcQVNgtKmUUe3zPsOPjE8Sb28f2QNmjcHVe
         okaJj/zrc2Sk99CCexpQpnP5oY1WFtTaIcKcrl1qgg/HRq89c+hAdJn7oFnYJTZUg7sS
         cgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RUBENAjQkfGkLEtSKfpJY1z2C5TtT9NMRbBfM1GXBE=;
        b=KL3YdUmO6rhZFjYw3IRXyONi+ej+XbZ886SQhPi5A1NscqmDDv8azqbvGGJglEQDgZ
         b21sxHgo9c/niIQB7I7iJTrHCDckPciiiFFwKO0MXanABt8FLNjG8OlthoABwlrOH1xk
         9u8gT5C1UsH92tKNrGST3Y+Ultl5YPs1TrUHIG7CpiDD4by7JJmk54lH6mQJR6jLM67y
         kUztmF024PBWAat3VTjdIFVKELmA3Ls9wsefUMDECjTPs3N5I+4TgVZkz88Skij1mN8p
         WHxNiftAesNdUDZJ4qAIudVTtZdy4z2/ALmdGPgiPyzIVhm61MOYe8cO+h59wReYw7xN
         JMXg==
X-Gm-Message-State: ACrzQf1JfRXk3Y/iaRg3g2mddfPlGo/835kGeOhm5RORy2jKByZqUPL/
	mTTAKJ5oir7KUv5Sk+ATGnE=
X-Google-Smtp-Source: AMsMyM7tHZoCOOV044Ori2MGgzx2IzDnrVlVzD5dtNkL8lx6YpywGPLFCbaAm5d1GQycgNW78lwWTg==
X-Received: by 2002:a05:6512:3b2:b0:4a2:48c3:1f46 with SMTP id v18-20020a05651203b200b004a248c31f46mr8303006lfp.572.1665483029710;
        Tue, 11 Oct 2022 03:10:29 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id g2-20020a2e3902000000b00261ccf566e3sm1986920lja.65.2022.10.11.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:10:29 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 29BAAPw3010708;
	Tue, 11 Oct 2022 13:10:27 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 29BAAPc7010707;
	Tue, 11 Oct 2022 13:10:25 +0300
Date: Tue, 11 Oct 2022 13:10:25 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Nikita Pavlov <icepbix@gmail.com>
Subject: Re: how get smbios blob with intel-ipmi-oem
Message-ID: <Y0VBEZnddPlHT3cW@home.paul.comp>
References: <CAJewAaLk0Q9fnmT_s_8TdnDfcJMXbLcS4=OZoeT5+qatDnGFKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJewAaLk0Q9fnmT_s_8TdnDfcJMXbLcS4=OZoeT5+qatDnGFKQ@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Nikita,

On Tue, Oct 11, 2022 at 12:27:58PM +0300, Nikita Pavlov wrote:
> Now I work with intel-ipmi-oem and want to get smbios blob. 

If you're going to use MDRv1 protocol then I can share the experience.

We use intel-ipmi-oem and it handles requests like 0x3e:0x20 (for
region status) by calling methods of a D-Bus object, which you should
also be able to query manually following

busctl introspect xyz.openbmc_project.Smbios.MDR_V1 /xyz/openbmc_project/Smbios/MDR_V1

output.

"xyz.openbmc_project.Smbios.MDR_V1" is handled by
https://github.com/Intel-BMC/provingground/tree/master/services/smbios .

Example of requesting status of the first region:

# ipmitool raw 0x3e 0x20 1
 11 01 01 02 00 00 80 cc 0a 91

> I use intel-ipmi-oem lib and ipmi-whitelist.conf with phosphor-host-ipmid.
> I test this by ipmitool like this ipmitool raw 0x30 0x1a and get:

Why are you using 0x30 0x1a, it seems to be
<Intel General Application>:<Get NIC Info> so completely unrelated?

HTH
-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
