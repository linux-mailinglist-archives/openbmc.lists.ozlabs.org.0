Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3854CCF4F
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 08:53:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K90V00vzsz30Ks
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 18:53:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SdY99FSR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SdY99FSR; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K90TW3K1Jz2xsc
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2022 18:53:17 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so6177802pju.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 23:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jnMwk3WWwDWBrcWMTOZcqLvTHHlc/AVwJtpiJHqmYfo=;
 b=SdY99FSRMbftku2AITJdqS+11I5/7VZnDXFyfOvu3lY/CwGtm56kRxgPEHHV27GMdf
 eQgOfy/4NpwLWRqTfzKI8QewqjXOjl6laAFYyVN8PtKP/hEyvy+Sm55Od3wxR7tPktlI
 U2hIfPct+nlz9M+5srBlRfouAuZ+oUKusXjEw8Cou3s6sGsrz0Dy7hqVWVSoQTreONs+
 sAqzVwNfbMJcJkCaZgqbZuaKoayItY3tj89qxCvk1vycnSnb6QqbW9fpeGsSb4hlZFUD
 tjPUnzYjCXhVeJMaIAr6kRUkpEnV+rGWs1wFX1nZ9YEjAYNbhbx90icpMf323sKV6Z61
 k+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jnMwk3WWwDWBrcWMTOZcqLvTHHlc/AVwJtpiJHqmYfo=;
 b=cWs8wNyF1CvDxTwdtgEJY6edHAHnKYAcXPnAVHu4mVSzc5APVsx0ZZZ1WL/D69PzoC
 bi09KJWyS6+MAmu+RlJ/aSvJTa1r9O2yP0Isb2kjGSeY0QTxx+1yBhSShjtDDUVUWDRL
 /g8f4wTksIs4V/uAaJBA9QFGMXZBW8BGM2ZqP2XNXO2DFQ0caADXYi8gwwGP7T2Woume
 rJlQPEGo5zcpIMVPAVP/gRiE3PXLYVqip/z4Dyqd6ULWN6akMznyDCJQes7k0KE3OzCt
 tL5a7HbDazsR68x9pV0itersO05VxcoA6h4bKq0UXgSEWAJvf4pDq/2wIHIRPNS8S23F
 seZw==
X-Gm-Message-State: AOAM532LNSNt/rG/O/x/7myreE/VchT5vxcOel3SctwkWFsyG7ADwLdT
 8mivHpsfLF1B4Z5w8Q1KVNY=
X-Google-Smtp-Source: ABdhPJx5ZqmfaCckfuVlw09tScsT3ZZJ2rb7l+uPMtsgYVHGJBa3Uw5JtR4CPP/YlNVGXH17/dhUCg==
X-Received: by 2002:a17:902:f681:b0:151:806a:94d with SMTP id
 l1-20020a170902f68100b00151806a094dmr18371436plg.85.1646380395156; 
 Thu, 03 Mar 2022 23:53:15 -0800 (PST)
Received: from taoren-fedora-PC23YAB4 ([98.47.137.113])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a17090a178c00b001bd036e11fdsm9940938pja.42.2022.03.03.23.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 23:53:14 -0800 (PST)
Date: Thu, 3 Mar 2022 23:53:07 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Message-ID: <YiHFY8fqYA+XOXhZ@taoren-fedora-PC23YAB4>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <ddac71ef-5b7d-31fe-3ee6-fe837b326697@kaod.org>
 <Yh8JIGpm4ZE1OXzl@taoren-fedora-PC23YAB4>
 <1806afc0-f716-4713-6ce6-0c46326c7655@kaod.org>
 <YiBaPFWQcX4tCBlM@taoren-fedora-PC23YAB4>
 <89483502-67e7-6a68-6883-fa25af677269@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89483502-67e7-6a68-6883-fa25af677269@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Cedric,

On Thu, Mar 03, 2022 at 08:02:58AM +0100, Cédric Le Goater wrote:
> Hello Tao,
> 
> On 3/3/22 07:03, Tao Ren wrote:
> > Hi Cedric,
> > 
> > The "No good frequency" warning is gone after updating spi-max-frequency
> > to 50MHz in aspeed-g4.dtsi (thanks). I don't see any functional failures,
> 
> Super !
> 
> May be send the "spi-max-frequency" patch ? I can include it in a v3 if a
> resend is needed.

I just sent you the spi-max-frequency patch in a separate email, and I
also tested the patch with both the legacy mtd/spi-nor and new spi-mem
driver.

Could you please include it in v3 (if re-send is needed)? Otherwise I
will send it after the patches are merged (to avoid merge conflicts).

> 
> > but flashcp ran slower compared to the mtd/spi-nor driver(~200 sec vs.
> > ~145 sec when flashcp 32MB data to flash1).
> 
> Interesting, the HW settings should be the same. Was the dynamic debug
> activated ?

Thanks for asking. Dynamic debug was disabled while running flashcp
testing, but I just realized the 2 wedge100 switches are using different
flashes (mx25125635e vs. w25q256), so it doesn't make sense to compare
the performance.

I ran more testing on the same ast2400 machine today, and test shows
spi-mem ran slightly faster than the legacy mtd/spi-nor driver. Let me
reduce the other noises (user space apps eating CPU) and will share you
more data later.

But still, no functional issues observed so far. Thank you again for the
patches.


Cheers,

Tao
