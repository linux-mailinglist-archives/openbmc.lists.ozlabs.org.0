Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D3FA29FE9
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2025 06:11:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpQDD3t3hz3bWH
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2025 16:10:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738818650;
	cv=none; b=HjEe446L+vpg6kogzcuzEnPKqxJFSRHnQF01u9lU6stj+87oigXCz/Y4W/8DlydO21MHa4q1Q0EwxM4ZndLgeVkD2P5liCuC923M8jSQ2x1lyqIV7mPQmVOwtgLOWCy3kokW+Ac1J1+Md4vAdHbgEGCTlDa8euFsU66irZvoMAYxLv2/gVCV9dUDKjldYz6WZxSKgI/Wdnz2c8L43YPAAJRXGv+A5nYut++rs8+EtX7Mm1ay/wROWQxMjkxEHSNRFUNkG1lGyc9JpZUfGcN2RruNKQMLvF5jz4TxiRPTmE1gXFghwH2gYSyidC2taNRBPAZ6v7FkHFf+gfd4c6iRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738818650; c=relaxed/relaxed;
	bh=BJKgS+zAQTMlYtd5HSKjusELSuWrHJO8EEjprWiMV5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYKUhE5H7Ni1Is2Mp9fPusBdsFY7RcwoTVofS/wOFDZAG5q6p04BbZVhICwjTgi0ZTl+dk+cDywd4SOK03Su4W6YcjyYudXyTAClsn1u4cR9DIFCia5JHlvVn4aQC7mC+iWhnHyI+bO5eizbIbEtfDHe5BgQBObf6VSs866Lguzgj6/TOnArQ6BNCCNRnGPaS59oc5MR1Z2Hv/CL7VVsJ3vK6BX3NMPtOtlYE8C2pSGNXliLAJFwDEhxSKNaZa6v7p9mPHYM6CuvDP6+bNSEUXGc7BdeCF2EbV4tFSGfgzIETbmXAH/0sP15EAbJ4XAU7YY9SWEGXRWFXHZJl8dFdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jms.id.au; dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EZ43whJ0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EZ43whJ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpQD73m2Cz2yDH
	for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2025 16:10:46 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7157cf352so324643966b.0
        for <openbmc@lists.ozlabs.org>; Wed, 05 Feb 2025 21:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1738818642; x=1739423442; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BJKgS+zAQTMlYtd5HSKjusELSuWrHJO8EEjprWiMV5s=;
        b=EZ43whJ0Z3Lz0TqOPsXgOPvcpe5iZTTPPnT6hCCGthwvCbp6Qc0KRiSK9DU6YYB5tj
         uqHGY9KMUWKYhUCJnPZhXf1XLEiqaU1/ipkktBDfkMM44oGztvw5Ik8f8HD3nyi5lUz7
         B2fkI6FT3dJzufPMcELewB2nLlfTtURlJ8Fq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738818642; x=1739423442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJKgS+zAQTMlYtd5HSKjusELSuWrHJO8EEjprWiMV5s=;
        b=qiVU+Axz/YXZW1n00gm4VDm3ahQ2XkpTpnKw1Zq7WaDzopbIVtLaXWyTErNbQx/Yy4
         CATj/Ufqut6wlPuA771RRg2mrIqcdR+0tBABkmTKQDPO5FlHaZ9FXHzeGXjeNSlc6K1k
         iWl11DKkTdF4VU4MNlN9cjsyN7AAhBI5nuVrezkVgdmS4O1cYv//YBtCj161C4VPiG3u
         ou4BEsaRFe35SNRthdXEHUot/Y3Qea1FGSpv/dDGZ8OX/WKlk+rxZ6ulgsZow89Lcg4J
         W9Dh0vgf7OdqGwNP+b+oCEE9mQgTAqquFt6o5M3xJltFFcqgSlGfsja1hRm4xPQNM48r
         /4zg==
X-Forwarded-Encrypted: i=1; AJvYcCWQdTcsOFr2d1E22Yg78eM07RkRvhPBeWaJ0N1AC3MNljfIAzgIMuvx4sKhoRJuOxFuJWwXmQwZ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/z7lqmZIfuQXo1fMLCuN36F8hyM1BeDVd7UG04qErjKh2IEGZ
	2HcPE8McKA57XZcTpPbF442vVZxem5zxRjl5gRTl9RyEObfeeVW6jSLrdjtlo04XDcnsiMoBlCf
	qjyEGADh2JWBnCdK922UKE+a492E=
X-Gm-Gg: ASbGnctxHtPPeMHb3dm5GA0MgivtI/iFF+2+BZJ3vrY2cNHaFwsAJEabg31VcQN2exD
	f7rjJnxCJX4EOOBmNK1tHrt/8dZQDQJxwxt2flbByUHcJaRHl1uSjJk0Mjz/SPFzdQlIVjkrc
X-Google-Smtp-Source: AGHT+IEx9kgWLkxuHR5wgA6Nhyq8xdSb4lLUrBQuCtJfJZwBlIOVfLCyskPZPpiWs44DcDWr+2MY4eaFSUT/pqzMA0I=
X-Received: by 2002:a17:907:980b:b0:ab6:eec7:e2e2 with SMTP id
 a640c23a62f3a-ab76e919721mr175250466b.30.1738818642167; Wed, 05 Feb 2025
 21:10:42 -0800 (PST)
MIME-Version: 1.0
References: <CAFCYAsdBV+j-7quHMMrRSmghFJL_MfeuDO5ufLMbbcQgpO45AQ@mail.gmail.com>
 <dbcfddc2361fb84d9b86f3c55e734b2202541ac4.camel@codeconstruct.com.au>
In-Reply-To: <dbcfddc2361fb84d9b86f3c55e734b2202541ac4.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Feb 2025 15:40:30 +1030
X-Gm-Features: AWEUYZksW9hrobTA75VzP1IgwTteOndFI-eiMq52xeH-zLTQzDth9jBmpFGCWBc
Message-ID: <CACPK8XcOJ=75JBn4YPPzAmG+FN0tJgOtHRqfRtKf2wYApGiXBg@mail.gmail.com>
Subject: Re: Question regarding OpenBMC crashing and messages of U-Boot SPL
 Already initialized
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, Jeff Johnson <jeff.johnson@aeoncomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 3 Feb 2025 at 11:30, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
> On Fri, 2025-01-31 at 14:55 -0800, Jeff Johnson wrote:

> > localhost login: root
> > Password:
> > root@localhost:~# BP0c00

The string BP0c00 is from the BMC's bootrom. I forget how to decode
it, so I'm not sure if there is any useful info there, except that we
know the BMC is getting reset.

> U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
> already initialized,

The SPL knows that DRAM is already up ("already initialized") and is
trying to move to the next stage of booting. It doesn't make it there,
and we see it starting over. We don't see the message from the bootrom
though, so it's not a BMC reset occurring.

Cheers,

Joel
