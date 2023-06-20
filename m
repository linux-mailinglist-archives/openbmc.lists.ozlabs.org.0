Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62EB73636A
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 08:12:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qY7m0jCV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlbrb4NWMz30f7
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 16:12:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qY7m0jCV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=ratankgupta31@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlbr048z8z2xvP
	for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2023 16:11:42 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bd5f59fb71dso4615250276.3
        for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2023 23:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687241499; x=1689833499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGbQH0EGiyZl3OM+TCbOjJkizMMzX0ksJB64tpNyx+Y=;
        b=qY7m0jCVVh6sQLix0667kpah5SRVcgpQOVV3VACU7ln1xIUezC9aR+FXSswe6cyDOh
         nZ8Xf8N3jonC1ezMjvTELxr4JeA1u9NdNTN/+afxYu2d8b16aQgVlKGW87SOnX89LTeJ
         vUIUYyy7vDE6/KIxiDGte8qCWSBVIvwjpa/5oFg1tGxAcfyc7/cxHHk4ctL4B7PI/JS7
         jau3jVr+r2R8Tb4l3XlOpcfyGzhPGR4bOHKu+BUB0lhI06edZSp8YDK623YA347hEGTN
         bQ5X4SXvI6Gtxc4xO31dMCmoO5ZutlK0bFZHOUWqvfTtddIBwcqe5eDxbUjpbUivWT8S
         Zu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687241499; x=1689833499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGbQH0EGiyZl3OM+TCbOjJkizMMzX0ksJB64tpNyx+Y=;
        b=Ll/AQeVYgl6QRBF4A04h5P5SCVEeSxwISW1XNTxKeIPLFebBEwlFEsRK30AZDkVOVK
         nuon6fBjF8O3UUA1apX3tG2/TvYnAKEVswOAIhe6TSEJyAjLBhp8TH0yqcyTzD3lusvT
         F3HhFu4cOBzRUTLwOhpJfnwVNFwmI1mo43y140dXb8cCVl7WluJcxZPg4mqRRv7Mli2a
         3PelnD3xCxKV4Jg+Vgax4etFu/4c0YB6L/7eR2NJrXLCCKfei646iuINOt4+mY86279m
         gLg3FwgyHN2yeCqrdyzcPypyyHjiLleumM/TpLLCcZKGN5aBQJ2QE+5lrOoBob5eupwJ
         YA3g==
X-Gm-Message-State: AC+VfDwKa4cGksQXMRwa9xYM/r+htN4IHZ7Fw0Mn1/VFKj2G9JbMynWm
	jXHZ4fWeUljnCDOl37HRWxcdyQNCHwF/CW8F6xA=
X-Google-Smtp-Source: ACHHUZ54/IRROFk25VtnStEYZLuA5OfHfi+w8vZ40z7Vv/9k71JVZORkGF1J6WxrTeu5m/1ajjWCIKRsUjeMjpqoOSQ=
X-Received: by 2002:a25:d657:0:b0:bdd:85d:a5d6 with SMTP id
 n84-20020a25d657000000b00bdd085da5d6mr8372139ybg.31.1687241498879; Mon, 19
 Jun 2023 23:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <DS7PR10MB486175B1DBCE7437A2F8E980A55CA@DS7PR10MB4861.namprd10.prod.outlook.com>
In-Reply-To: <DS7PR10MB486175B1DBCE7437A2F8E980A55CA@DS7PR10MB4861.namprd10.prod.outlook.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Tue, 20 Jun 2023 11:41:28 +0530
Message-ID: <CAMhqiMqGwvNFP7knyTQz7bLk1jHffhkqCb74oy7cZswQQz57wg@mail.gmail.com>
Subject: Re: The design of multiple VLAN at OpenBMC
To: =?UTF-8?B?S2VubnkgV3UgKOWQs+W7uuWvrCk=?= <KennyWu@ami.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Pravinash Jeyapaul <pravinashj@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kenny,

You can have multiple VLAN on the same interface, I don't see we have
a restriction on the number of VLANs.
It is up to the system admin, How many VLANs do they need? In a
typical scenario, it should not be more than a single VLAN.

Thanks,
Ratan

On Tue, Jun 20, 2023 at 9:39=E2=80=AFAM Kenny Wu (=E5=90=B3=E5=BB=BA=E5=AF=
=AC) <KennyWu@ami.com> wrote:
>
> Hi ,
>
>
>
> We are develop OpenBMC and meet some design question need to consult. I w=
ill be appreciate your responses.
>
>
>
> The VLAN behavior at OpenBMC. It support multiple VLAN. Is there are any =
restricted maximum number at each service IPMI/WEB/Redfish. Or it is decide=
d by developer?
>
>
>
> As I know IPMI is only service one interface, VLAN or non-VLAN. Once user=
 enabled VLAN, the IPMI daemon will respond both ?
>
>
>
> Thanks,
> KennyWu
>
>
>
> -The information contained in this message may be confidential and propri=
etary to American Megatrends (AMI). This communication is intended to be re=
ad only by the individual or entity to whom it is addressed or by their des=
ignee. If the reader of this message is not the intended recipient, you are=
 on notice that any distribution of this message, in any form, is strictly =
prohibited. Please promptly notify the sender by reply e-mail or by telepho=
ne at 770-246-8600, and then delete or destroy all copies of the transmissi=
on.
