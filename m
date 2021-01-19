Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF1B2FBBA1
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 16:52:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKtTK6wQBzDr0p
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 02:52:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h3vVsjei; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKtSG5gSXzDqwg
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 02:51:39 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id n42so20171671ota.12
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 07:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+YWmB9C8YvgE6/oLUj5BU396H9QEjQxlNzvw5dl0YSg=;
 b=h3vVsjeiD8ALXo7VqfyoumPb8ZxifA1AwgwsDW4sZwIen3hw6uTHGHu0m3aDbD9hWp
 5PhHt6Jj/4cN9E/KBbWD4scYJeCdXtl6dm1qcVjdxLkSUTHAEBkrI2yAO9VCoAmzNuFh
 9eXPx+bEDJ4+weIY7tqttZXstJpl5PEefHGtR1j+A2Jd41fzgkC9QIogx8Q+8AXURp6k
 /BA0/uQKdLaFcwoIFmbZqjFbWkpFrIf8ct4zUgkxjVIIoidD0oUNBQdampSNVx2waH7m
 7GkKSIVD+L/M/f+K/5ft5cBm9pKC8Gsq94Db+/nfz4Bcv9nEueYJHA9JZKMRoeoN2S2h
 vQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+YWmB9C8YvgE6/oLUj5BU396H9QEjQxlNzvw5dl0YSg=;
 b=mTC7Fu3gpIzc2CHkVGIzGH7C5bU9QxMY0KzSSzeaMERK3fVABRL+LkU3QQ/YXo8Be9
 h6Dl71uuqj6YWTQEv9QS1LwcH+EMlMMTsG/7obGtEMcpZoYX/IPeC9BL+L5xosxDsRty
 0dsmLPPVzx6KNdmVHYRoSTi99H4LL1dBkKQ7UyB+sJ7xWrff33aZXZKrJgtyc9i7oaTB
 ojSv1/JtpMkbvoMoXoxjVzjyn+asqtyaI2TOT16guzUAUOdBja+Z46ithS+qBXQLkq5v
 Z7t03ugnP8vTuHmsDCJiPhN6yiQHzkY1sMTC8tB4N6hynlv/7K9TseEeblrfUfF58K4L
 G5HA==
X-Gm-Message-State: AOAM5317dEqC5hvnb5Z/Hncyuhk8SvoBeK4l9VNoCyaXaol+RnGjX8ig
 BvKPVSu1mtBY6CA4aSYXC2M=
X-Google-Smtp-Source: ABdhPJx9Zj6mWaPFYqAYDUsMx6/0nPAPOmeOhFMycxiYZlFPuOsJLvBmynMcVrynvNrz1GQK6gKkKA==
X-Received: by 2002:a05:6830:1dc8:: with SMTP id
 a8mr3992517otj.26.1611071496168; 
 Tue, 19 Jan 2021 07:51:36 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id p28sm4555912ota.14.2021.01.19.07.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 07:51:35 -0800 (PST)
Subject: Re: CCLA Upload (Compal)
To: openbmc@lists.ozlabs.org, Willie_Thai@compal.com
References: <14e4b87d97bf4c589ceaaa8c19f67d1a@TPEMBX06.compal.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <c7953801-ec81-4dd3-5189-a3157965e8d0@gmail.com>
Date: Tue, 19 Jan 2021 09:49:23 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <14e4b87d97bf4c589ceaaa8c19f67d1a@TPEMBX06.compal.com>
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

On 12/22/20 9:52 PM, Willie_Thai@compal.com wrote:
> Hi OpenBmc Committee,
> 
> I am Willie from Compal Corp, we would like to contribute to OpenBmc 
> project, so we want to upload our CCLA.

I have previously tried emailing you directly, maybe because of the 
holidays this message got lost.

The CCLA we received from Compal was not signed. Please have a company 
representative sign and return, and we will be happy to get you started 
making contributions to OpenBMC.

Kurt Taylor (krtaylor)

> Please help to approve and let me know if there is any question !
> 
> *Thanks.
> Best Regards,*
> 
> *Willie Thai*
> 
> COMPAL ELECTRONICS,INC.
> 
> 6F., No. 585, Ruiguang Rd., Neihu Dist., Taipei City 11492, Taiwan, R.O.C.
> 
> Tel +886-2-2658-6288 ext.15728
> 
> Fax Tel +886-2-8751-1690
> 
> E-mail: willie_thai@compal.com
> 
> ===============================================================================================================
> This message may contain information which is private, privileged or 
> confidential of Compal Electronics, Inc.
> If you are not the intended recipient of this message, please notify the 
> sender and destroy/delete the message.
> Any review, retransmission, dissemination or other use of, or taking of 
> any action in reliance upon this information,
> by persons or entities other than the intended recipient is prohibited.
> ===============================================================================================================

