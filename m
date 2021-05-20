Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEFC389B7B
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 04:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlvDC5KKBz302m
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 12:42:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=YysJ3scb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=YysJ3scb; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlvCy1B9mz2xvf
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 12:42:36 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id j6so19451458lfr.11
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 19:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fuieVTtf8ogdKppOgnG0ep3blPAL720Ah1UqbJ6g7MU=;
 b=YysJ3scbWEsyDo6iyd1Qo5GX/Oy+7RIC3TLyPkxGQF19OJOsBLGXdEdOyEhvGAHULh
 PcLqErN55JbHNzED7jWLYjiAoZYUmkZS3c/Pcg9iSblttWLMqltg73o9xQBOwgCLD2GK
 mNHrxoMtO6mcgf4srNt+q2L3Y54skQdYkQIClBFDafiJGpdzC1nLhLlms+O8ymluC3QH
 XhvC2U5u4JJEAuJEyIRuSqLRJF2v9/svlL1lel3F7lNHscA3PrrOZDlGM0uZ8gnNNdl2
 Cyc3fWVa+3SmKdE9j77xVmd66B6Cnj8AAAlBGNqG+L1zhz7/TbHdzBSyYC7piDTWvCo2
 1+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fuieVTtf8ogdKppOgnG0ep3blPAL720Ah1UqbJ6g7MU=;
 b=b4ArAbdDXvvMae1223EBM6zOxlYZpCjhasdDIFvxiRjbW14nCscRxoyVfRemJrhBxb
 5H/8HIamu65R0+dB2WByjj7QuTwvFoqGro9fD3ru/k7MOaWVmzDHOPg9FO00aYZy1+DK
 ja1KIXyNAyRDpeDrLH+41XKYFh29LI8UZtY1N86J4D3vlelo2IWF2/fpUe5FkUVj/R25
 7Ibahx5hczAz0ud88ivkdDKQiZ/ctmkCpxhmt4CPMwj3eRnl9ZMVzMmi2nsx6gpBDvy3
 3lURPr3vGv3o4yuKxSsUD+Uhgoqx6d6w8KXTd5/dSrKBZSu2hELNOsstzDbkSh+dbme7
 EK0Q==
X-Gm-Message-State: AOAM532Qfh3yR34EhOor5HyhV75I0qDV7W+HcBa6I58vzS8lMEOD38g3
 7uV8QrXzrUN22IMySwhYxfNt+qOVrMlayUdhrD+rOw==
X-Google-Smtp-Source: ABdhPJxeNRh6sBaEoQD+DuH3Qm7JnRJbAKuGar0CeWxbACa4G9nGbY6zvX21I2hev4OX6qFpdlss0WPXxR7QBBzK+3U=
X-Received: by 2002:ac2:5df3:: with SMTP id z19mr892394lfq.386.1621478548581; 
 Wed, 19 May 2021 19:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB3954243C26C79A3E8586CFFCDF2D9@HK0PR03MB3954.apcprd03.prod.outlook.com>
 <YKXLPghzZKn+GV7r@heinlein>
In-Reply-To: <YKXLPghzZKn+GV7r@heinlein>
From: William Kennington <wak@google.com>
Date: Wed, 19 May 2021 19:42:17 -0700
Message-ID: <CAPnigKmhSjCtT0d7XhAoB87P0mD0hg26F26mLN9iDBhz__qwZw@mail.gmail.com>
Subject: Re: phosphor-host-ipmid will crash on aarch64
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 CS20 CTCchien <CTCCHIEN@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Looks like it could crash if the file was generated on a 32-bit system
then updates, or if the file is created without data and read by the
handler. It's definitely missing some sanity checks. Given that it's
serializing data to disk, it really should have used fixed sizes.

On Wed, May 19, 2021 at 7:37 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, May 17, 2021 at 03:21:14AM +0000, CS20 CTCchien wrote:
> > Hi Rthomaiy,  Vmauery,  Pstrinkle, Jayaprakashmutyala,
> >
> > When I build phosphor-host-ipmid for aarch64 platform, size_t will be 8=
 bytes, but in aarch32 sizte_t will be 4 bytes, so ipmid will crash at http=
s://github.com/openbmc/phosphor-host-ipmid/blob/master/user_channel/passwd_=
mgr.cpp#L323, due to the data size of hashsize and ivsize and padsize and m=
acsize is 4 bytes in /etc/ipmi_pass, but ipmid will read those data as 8 by=
tes.
>
> Why does the data end up being only 4 bytes in the file?  As best I can
> tell line 538 is where the data is written and it also uses
> sizeof(MetaPassStruct) to determine the amount to write.
>
> > /*
> > * Meta data struct for encrypted password file
> > */
> > struct MetaPassStruct
> > {
> >     char signature[10];
> >     unsigned char reseved[2];
> >     size_t hashSize;
> >     size_t ivSize;
> >     size_t dataSize;
> >     size_t padSize;
> >     size_t macSize;
> > };
> >
> > If I replace size_t in this structure with unsigned int, then ipmid wil=
l not crash at this point.
>
> We generally want to use 'size_t' for things which are sizes.  The code
> here is a little dangerous in that it is doing a raw cast to/from the
> in-memory structure rather than doing a real serialization.
>
> I'm not really seeing where the code is inconsistent with itself though
> that would contribut to a crash.
>
> > But those fields in this structure are also used to store the return va=
lue from other functions, like EVP_MD_block_size(),
> > And the return type is also size_t.
> >
> --
> Patrick Williams
