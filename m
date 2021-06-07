Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D251439DD35
	for <lists+openbmc@lfdr.de>; Mon,  7 Jun 2021 15:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzD4Q1sDPz2yy9
	for <lists+openbmc@lfdr.de>; Mon,  7 Jun 2021 23:00:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CC03vdf9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-oo1-xc31.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CC03vdf9; dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzD4154Gvz2xvP
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jun 2021 23:00:00 +1000 (AEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 x22-20020a4a62160000b0290245cf6b7feeso4094325ooc.13
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jun 2021 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=44EP580vfmKbpNE/h/ITINNG7D7dpqU4VKekXv6Ec5M=;
 b=CC03vdf9X1g1oGZ+mn7Y8IvDtXQwsBs4YKgRb7jyEv+kwMyQotiNIhlQp6sK+fsy36
 7DFlRBgCPDqdqnsBxNNTb2c6AjFOwLEG7Ei++llfQ/w26T/tTeNMr9DYq0riZsYgI56Y
 XaoOpBR6qKvEtNABMh0pBttalcRn6QpRfSJzO1udLxkFC/I20ZwBudJbs6rLFm9/+FvO
 U3nO/eRYMARYjV8djI3onYNdcIeWLSLpyQLituFGXlb2/E4NS8nPnKWW4DPOM1ooGZCG
 fME7zR8jg6FEb1fptUvwXcdBpVecGYob7hG0Dv++eIA5sDMtwo8Ct6NCH5ivG11DxlU/
 oGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=44EP580vfmKbpNE/h/ITINNG7D7dpqU4VKekXv6Ec5M=;
 b=Pz6lAPTvQAOzK1GMY7lndQEzmkyvpNGaL+KRqhB3GT/fa23VpPiCoHhn9Fe78dj02X
 oS7Pk7brZ5XvchKlWdwV+EipM4sg5cHbqHoPhESvdsROL7OAMcNFFc299g8z3kFTjtBq
 umoooj+NG6Qr3PjqryedkE7DlFgSrC++wiZWFiz478fd0xV2BoqhR4UzSF8buF98bJa2
 Q/ncc0QZrLnUqKkZxLe5pOPjhN1tiAl/C9N/kR5YJ49vq1OGB8NPSgTDldDLFPNXI9aG
 hLRarOZR1uYgXYsdTl2ZoiqXsPvEoM/Y/yvtZVYeDS7JtQHBjclfzsvp/9HfBNFbxeKj
 j9OA==
X-Gm-Message-State: AOAM532XNzPLP0PEEtec53njonqbn+3pg86mRh0tZS3NB3rowFp06xM7
 nr9Wtl5ERA7qAuCkWnfYN2uzGQR0GM/ttA==
X-Google-Smtp-Source: ABdhPJyW+BSoB1F9v6CvzmfOxsO/oGMutAPBSak9i7FXPsGFc2lUseqe+7Ia/JiTSTPOo0yqxux4cQ==
X-Received: by 2002:a4a:b544:: with SMTP id s4mr13147687ooo.62.1623070795958; 
 Mon, 07 Jun 2021 05:59:55 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:65cd:5f46:ae0e:8196])
 by smtp.gmail.com with ESMTPSA id o4sm2064311oon.15.2021.06.07.05.59.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jun 2021 05:59:55 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <1afee506-f30e-9f2e-9614-566e58ca25c5@os.amperecomputing.com>
Date: Mon, 7 Jun 2021 07:59:54 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <8EB56E60-53B3-4671-A64E-9F2FA73EB77E@gmail.com>
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
 <20210503143347.gncdsonvtqzpfmdo@thinkpad.fuzziesquirrel.com>
 <1afee506-f30e-9f2e-9614-566e58ca25c5@os.amperecomputing.com>
To: Thang Nguyen <thang@os.amperecomputing.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jun 7, 2021, at 3:45 AM, Thang Nguyen =
<thang@os.amperecomputing.com> wrote:
>=20
>=20
> On 03/05/2021 21:33, Brad Bishop wrote:
>> On Fri, Apr 16, 2021 at 09:05:36AM +0700, Thang Nguyen wrote:
>>> Hi Brad,
>>>=20
>>> Can you help create 2 new repositories for Ampere specific codes:
>>>=20
>>> - ampere-platform-mgmt: contains codes for Ampere specific =
applications to monitor and control Ampere's Host like RAS error =
handling, Temp event, ...
>>>=20
>>> - ampere-ipmi-oem: contains codes for Ampere specific IPMI command =
support.
>>=20
>> ampere-ipmi-oem is ready for your use.
>>=20
>> thx - brad
>=20
> Hi Brad,
>=20
> Can you help enable CI for the ampere-ipmi-oem repo? It does not =
trigger CI when adding new patch in gerrit.

Done

>=20
>=20
> Thx - ThangQ
>=20

