Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D408132A6D9
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 18:02:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqk2v6DDZz3cPh
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 04:02:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=u26jiNM9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u26jiNM9; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqk2g5MSzz3cG2
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 04:02:34 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id z126so22669080oiz.6
 for <openbmc@lists.ozlabs.org>; Tue, 02 Mar 2021 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=P2JKjpMLEEuRc5ZRlDOfs18K1+TMftC95oOTofyZoJ4=;
 b=u26jiNM9f6hAcKbvIpdUc/FUPe5bSTwgh6Nu0YKjZirv2uA2eZzcnnJAjKdzA32B9a
 Pvx/AJnPIg3qBdkUct7/VF3XxZJcHFDZH80drZyCjji6BKitf7dHOMoRW+0dz3Snd0N9
 37uiVO3itcihxEjN6WVTXX3U+ZzOrO7iLoPgePcHHJVetQHE4aRI/zXaxESknfsq+Yfn
 jWRyX1xmQ/cTAJsD9b6PH/xfSMP+duVzcy69FsQV7HTwEuYAuEkay2tvL+n9IW6IiarG
 gAfnm41s+APbunuDniVDET7xQi0uOkWgvk6tbDLJenKgUqFPK/xujH0v38Q6kQPKXzY2
 YV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P2JKjpMLEEuRc5ZRlDOfs18K1+TMftC95oOTofyZoJ4=;
 b=mDPA939XYHuD0KcfFRNLlzcV5O3wlrOSB3cbW55no93Y0ftUU0jrdZtc3JTzoTBlPe
 +SJ8Kv/wKkpXZy2xMzuz/BLVC7KT9PW1CsNHvLi0peSYviMdGIwNOkp+oCwnfLftcENP
 qthhOlH8Kvj0x0cZhGhMVxQehk0rewYeREG4dCGBlckiQh9KOBWhPZ9LAdMhKLHv3aC3
 pNYg6Dmt1b67jgkvcMaTmtLqYBpzNMXMBjYQWPYrom6DBiWn0BFZ5SEvGmhoPMlsnQkA
 +no6SaME+v1nfRECHnYilZMv8UmIuf4RpBVWvEY8ZFCM+VLPTp6pP6waOmHlszp2q8w5
 U0bA==
X-Gm-Message-State: AOAM530MVVEoh796pEb1NjQSEup6ZfdyzDVhraOnzy9FOAfcbziW01lL
 3w867qe2mimEyKvLqtfLOIuEIBFi0PpzQg==
X-Google-Smtp-Source: ABdhPJzOe80YTHFREd2wqnsddxDS2f7+a1rM9EVvoVXGEh3Og77RTMvIQmATAntMfUxOUItwjQzODA==
X-Received: by 2002:aca:bf8a:: with SMTP id p132mr3942718oif.9.1614704549271; 
 Tue, 02 Mar 2021 09:02:29 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id y7sm4237802oiy.57.2021.03.02.09.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 09:02:27 -0800 (PST)
Subject: Re: Equinix CCLA
To: My Truong <mtruong@equinix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <MN2PR04MB6127F039EDCE65A0B700B452BA9A9@MN2PR04MB6127.namprd04.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <6a204901-c608-16af-12e6-89432c82d889@gmail.com>
Date: Tue, 2 Mar 2021 11:02:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR04MB6127F039EDCE65A0B700B452BA9A9@MN2PR04MB6127.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/1/21 1:34 PM, My Truong wrote:
> Hello OpenBMC Community,
> 
> The (formerly) Packet team is updating their CCLA to reflect the new entity and contributors. The updated and signed document are attached.

Your revised CCLA update has been accepted, thank you for keeping it 
updated!

Kurt Taylor (krtaylor)

> 
> Cheers,
> My
> 
> 
> My D. Truong
> Director, Hardware Engineering
> 
> This email is sent on behalf of Equinix, Inc. or one of its group companies in the territory from where this email has been sent. The email and any files transmitted with it are confidential and solely for the use of the intended recipient. If you have received this email in error please delete this email immediately and notify the sender.
>   
> 
> 
> 

