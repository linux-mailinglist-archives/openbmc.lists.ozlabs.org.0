Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6037D07BA
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 07:43:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WNREeDm3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBYQv3xtVz3cbR
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 16:43:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WNREeDm3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBYQF4cPsz3btq
	for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2023 16:42:44 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-27ddc1b1652so382171a91.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 22:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697780562; x=1698385362; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1iwWORG+HyNeN4+QIPQvuH+bmRzTZOa0GVBDt1M8mY=;
        b=WNREeDm3HxmKmWMZVT7qwvOMvOCys3VedlgN1LLpZTKTSBq+iNJSbm94JHCBFWJRqy
         wSV7qOPanFdrn7i8GLQFiAuvm+xsV+lYzaylxCXNaIazuB+GI/6WlqmMlgXPxSX8fmSI
         gM1pakPGGhRaEcR2+mThPnbbp07m87lHYxpkeYrpWAF8NQ6glXnW1Mvfgp6fO7tCQgvE
         4lhyWaTej8zgcFkhOP7yOUYF2X4SlepXtXCdIXNqZF+2EMPsSTwsZ/uKYjszmCD5HhOy
         VTrcBuip71XpjeRlPivFhc92TjO75jaE+gLyTavyxwN6F2UIxCagkPddPcLGLNxD2g7h
         8DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697780562; x=1698385362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1iwWORG+HyNeN4+QIPQvuH+bmRzTZOa0GVBDt1M8mY=;
        b=aqBymGzO0e0fHSkdnp8j5svAOo4zVf5m8f43NBuuegfMaDUCGkIvujSQ/iyU1BaRGM
         6hNe6/yLGaRwLFv0ggZR2EZyUFpF9ADs7pLi7HMb4wvmYG4vHzY/2eXT+E6BMBzMR6c9
         8TsTBE6qTnypZCDSlM+vQi/PLs8vxDhFeE5C9Yxw8B0uEyAbK5riNyxzpHz9kcrURaSq
         jYXXFb5sdELjP5UlGWEbSRFi4LpgpLm0CTZcJuvNmZkvTYlc6kqV4T3efGNSkO8mY8/w
         nOS2NaGb6QDoob3N9b2yBk/ddPVtEb7kOEnFVSmNaik0mOovbnsZTsaBM6BWszzWcjd8
         6jcA==
X-Gm-Message-State: AOJu0YywZ5mziEAh/AiuSCLo7gWxOz/indTSG0kUqyJzXea/dYQTnLkH
	gjv/LHWrcWmrxrSk7PLYF+k=
X-Google-Smtp-Source: AGHT+IEDwj26dSHMbGPqqa5dcEA9LEuPxmz3fiQ1U69rxwy/rQYD+YBNDTUwVcKd1BAZuCPlPJhJpA==
X-Received: by 2002:a17:90a:41:b0:27d:50a:f8a6 with SMTP id 1-20020a17090a004100b0027d050af8a6mr1037726pjb.10.1697780562153;
        Thu, 19 Oct 2023 22:42:42 -0700 (PDT)
Received: from ?IPV6:2620:1f7:3d44:7c4b::32:3cc? ([2620:1f7:3d44:7c4b::32:3cc])
        by smtp.gmail.com with ESMTPSA id pw4-20020a17090b278400b0026f4bb8b2casm2511067pjb.6.2023.10.19.22.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 22:42:41 -0700 (PDT)
Message-ID: <887cb532-a66a-488e-a238-04a67b1036cf@gmail.com>
Date: Fri, 20 Oct 2023 11:12:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: D-bus model proposal for pay for access features - LicenseService
 at OpenBMC
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein> <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
 <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
 <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
 <762c3491-93df-4ac4-9a44-a3fb1b448936@gmail.com>
 <7xefpmuelqu2nv6iwkpaqqgeomdp7ru4uywejmqudeao7f5rbl@hqnhwttquefv>
 <3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com>
 <7be0e5989986a85748ba2af7e1ee0014a20d658b.camel@codeconstruct.com.au>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <7be0e5989986a85748ba2af7e1ee0014a20d658b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, gmills@linux.vnet.ibm.com, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 20-10-2023 10:36, Andrew Jeffery wrote:
> On Thu, 2023-10-19 at 15:56 +0530, Sunitha Harish wrote:
>> More over this new meta-oe work will turn out to be costly.
> It's a bit of a tangent, but I have to ask: What's the basis for the
> assertion that adding a recipe to meta-openembedded or some other
> upstream layer will be costly? That's not at all my experience or
> expectation.
>
> Andrew
We are not planning to have a license SERVER at BMC, which will 
interpret and process the licenses. There is no usecase for us to do one 
in near future as well. Only need is to add a way at BMC which can 
enable user to upload the license by implementing the LicenseService 
schemas. Considering that, i mentioned that this will be costly for me.
