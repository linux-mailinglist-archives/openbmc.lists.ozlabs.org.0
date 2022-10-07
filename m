Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 446D45F793F
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 15:50:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkV7q3qZZz304J
	for <lists+openbmc@lfdr.de>; Sat,  8 Oct 2022 00:50:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DJcg7wvT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DJcg7wvT;
	dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkV7D3KzSz2xHW
	for <openbmc@lists.ozlabs.org>; Sat,  8 Oct 2022 00:50:14 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id q7so3306206ljp.3
        for <openbmc@lists.ozlabs.org>; Fri, 07 Oct 2022 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MeNz11fnI72Cd0MI+bpXYJ+o1pee8vOpQNbTgFRK4IY=;
        b=DJcg7wvTmo/YuDNW0DOSdIjWQORrZhwqHg7aGFMri9JDaT+US8xRuWFp+sekqexvow
         Szo66ZWKa4LAgx6iVXqm+IgNCrKoNb3MxKFF2bMijKLuMMqldjU6JbaFBj2G8wQoDFml
         9JP04LN40ErePqBN040ZPSF1YXBXwK6gd5Z2whWJdS7CkggujC0LVtJyM8CZC/lURBWb
         LbULJRZDrbFNuKtRFXiM0ThI76WG7LMeTVtIOg29FfhFJDhJYGRRMEK5fUoeNv/AgGaY
         0hzK9oiO07YQ79HlWDebi+VW2gn5U6pcRTzL5QYvl2m8YZ8AWKOwlPc3OjUi1o5iMwDh
         TCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MeNz11fnI72Cd0MI+bpXYJ+o1pee8vOpQNbTgFRK4IY=;
        b=RYmC+br7Xloi6Dtg5hPsh9e5X1INPXx99+UWCH4lRlq+bwOuNOUXy91w6vzzPitShI
         4qF6DGV+W46NF0I4OdI1AW4iwSXzlW23aR2HpGbMPu4ushRK1cB0lcQUaWSkQyl4GPKA
         noOWnmwLYq4WOWvxwGOkvkcumfWdmXO0GsuR3qdomceNEHOKbITb0a9XOIQQCvoCD1nI
         ngpx7A/ZlRHiIvaVmXOty5NsPqGJePt15D2Z95BDbkQnr0Mmeq/b8GnUF1NW4AeL65b0
         Cikr59gbSDx9GfLSKo0TWsrRIoapTnDVlrKwZszqkZYVTxGtxHAMKoSpcqn6ikbF7b5O
         tZEA==
X-Gm-Message-State: ACrzQf11deEfSAJe3UXGVovmBwH16f1vV9lGsIe4QyAbPwCRIkmprKG1
	wTxSAN1ggKOJpynG5/UJnVI=
X-Google-Smtp-Source: AMsMyM7+RwenwAc9wOEF4sSFCOZcfTdKPJMFDh5rt8xmR4FGkDai7jxrNphO1sTnf/VzKRSbE95UrQ==
X-Received: by 2002:a05:651c:158e:b0:26b:46a6:bf63 with SMTP id h14-20020a05651c158e00b0026b46a6bf63mr1634446ljq.21.1665150608173;
        Fri, 07 Oct 2022 06:50:08 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id x5-20020ac25dc5000000b00492d064e8f8sm299213lfq.263.2022.10.07.06.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 06:50:07 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 297Do3Nc020516;
	Fri, 7 Oct 2022 16:50:05 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 297Do35F020515;
	Fri, 7 Oct 2022 16:50:03 +0300
Date: Fri, 7 Oct 2022 16:50:03 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: "Erhan Y." <erhan14@yahoo.com>
Subject: Re: ipmi kcs problem
Message-ID: <Y0Aui0b/6eGNbDwH@home.paul.comp>
References: <2116344159.3312599.1665147362407.ref@mail.yahoo.com>
 <2116344159.3312599.1665147362407@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2116344159.3312599.1665147362407@mail.yahoo.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Oct 07, 2022 at 12:56:02PM +0000, Erhan Y. wrote:
> We are trying to get SMBIOS tables from host on BMC (ast-2500).

What tools are you going to use for that once you get IPMI exchange
working? On our Tioga Pass system it's performed by UEFI on startup
using MDRv1 protocol.

> KCS#3 is enabled in DTS (with address CA2)

&kcs3 { 
        // BMC KCS channel 3
        status = "okay";
        aspeed,lpc-io-reg = <0xca2>;
};

is what works for us.

> [    7.796852] ipmi_si: IPMI System Interface driver
> [    7.796893] ipmi_si dmi-ipmi-si.0: ipmi_platform: probing via SMBIOS
> [    7.796900] ipmi_platform: ipmi_si: SMBIOS: io 0xca2 regsize 1 spacing 1 irq 0
> [    7.796905] ipmi_si: Adding SMBIOS-specified kcs state machine
> [    7.797140] ipmi_si: Trying SMBIOS-specified kcs state machine at i/o address 0xca2, slave address 0x20, irq 0

This looks correct.

> BMC Logs: 
> [    0.301014] ast-kcs-bmc 1e78902c.kcs: Initialised IPMI client for channel 3
> [    0.301085] ast-kcs-bmc 1e78902c.kcs: Initialised channel 3 at 0xca2

This too, 1e78902c.kcs is created and used.

So everything looks proper so far.

Do you know if LPC communication between your host and BMC works at
all? Apart from KCS it's also often used for 16550A serial ports (with
BMC being an LPC slave).

Do you have appropriate confguration for ipmi_kcs3 in
/usr/share/ipmi-providers/channel_config.json?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
