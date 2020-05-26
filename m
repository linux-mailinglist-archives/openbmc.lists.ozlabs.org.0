Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 168BD1E29F3
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 20:23:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wj4q1LChzDqMt
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 04:23:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GaeHUO2s; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Wj440MLkzDqBb
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 04:22:27 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id r2so12815626ioo.4
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=w9QDyyLBTo8423VUPh7xgv1HHEfnt8jyVl241usFtDQ=;
 b=GaeHUO2sXrdIkpaoXe9n35xLxXG1nWrGcD7JN7fQCStyHuUJNXfmcEEI/xI8yuwi1f
 fwY56TyaTBj/uZi65I6YvZ9wDlS/tampfWHJoOhDXlru0DbkpnNuRd3Urv1B5BYykfVw
 KfkYRCwgzJfAkZnvLWU6pIs6LfgbHhZG9e83m/l+PErut1O4FmNVtjphKGwTGp7+nki+
 KJEOHqseFmokgJ7ErufG/Pc1zMCL3ZuOdgslZnIiELkLi7Ruhrjnxkv0ugF/uW7I+HvQ
 h1Ywxleu2YM7cC31Kmgm2GcMrkINDdnMqZ2ra786UErIFk1VPCe4TcoPgo5AXpmW41mH
 f1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=w9QDyyLBTo8423VUPh7xgv1HHEfnt8jyVl241usFtDQ=;
 b=RaChUPPnoI4UjsTbhjM1HRjsMBUHXu1JDmWUueVP8PHwAaeyEnz9dvhvEt17mk5LrJ
 U5KC6uM3jVAt8TVYgaAHZNpeywp2ZS4OODnlmUHEo7KHoBwSLNoB7PHCvFDFzhRSiKkR
 TcqZrVf+diOA3RrVlFQlD4QdmXVKA0ttmaGajsNE+zWyKFOCPcHLQPGvjwNIAM8PBlwv
 dP9o5V4zJJ+vpaAsL/y8b6MRzF/niBWKWztpE+MKV4grU1zrs/Ww8o2F/xlXqU7afTss
 d/HGNpD1KKG2YTj/izhfEl1g1UaZHO2bZxH1yEe2gHmpzGuMBwp1StEepnQOfyjn7a/G
 jOCg==
X-Gm-Message-State: AOAM533KxKvvfXHGAwb/sds86LPiLAsZWzS52x41QQiIBnIIa1Ohcarr
 7yEl25LDlHF/E4INMN5NXJvNb/obMV8=
X-Google-Smtp-Source: ABdhPJzfZiP98BtYnXBtB/Cw6n0UIiZ6DEAy/SS1jY9800w9VI9vOQp75ZrMSzN8pdrIxrbpU98Brg==
X-Received: by 2002:a5d:8c95:: with SMTP id g21mr17938286ion.72.1590517343795; 
 Tue, 26 May 2020 11:22:23 -0700 (PDT)
Received: from [192.168.1.110] (096-042-251-064.res.spectrum.com.
 [96.42.251.64])
 by smtp.gmail.com with ESMTPSA id b18sm329918ilh.77.2020.05.26.11.22.23
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 11:22:23 -0700 (PDT)
Subject: Re: An IPMI Request Visualization Tool
To: openbmc@lists.ozlabs.org
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
 <20200514135723.GE1166713@heinlein>
 <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
 <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
 <2775.1590100786@dooku>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <1744a71f-2d02-ed8a-356a-12219e5653df@gmail.com>
Date: Tue, 26 May 2020 13:22:23 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2775.1590100786@dooku>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 2020-05-21 17:39, Michael Richardson wrote:
> Sui Chen <suichen6@gmail.com> wrote:
>      > Thanks for your interest! I'm also using dbus-pcap to track certain
>      > issues on the BMC recently, and would like to add support for all DBus
>      > messages to the visualization tool, making it somewhat resemble a GUI
>      > version of dbus-pcap.  The goal would be to be able to use this tool to
>      > investigate both DBus and IPMI. The way I plan to use it would be more
>      > similar to how I use GPUView (full-system timeline rather than
>      > inspecting individual packets)
>
> Interestingly, I was not that clearly aware of dbus-pcap :-)
> I ought to know more, as the lead libpcap maintainer.
> Is this visualization tool part of openbmc, or is it a generic dbus
> visualization tool?
https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/dbus-pcap
>
> We recently brought rpcapd into the mix; it can be invoked via ssh.
> I wonder if that might help you as a debug tool?
>
>      > If you ask how this user interface might differ from the already
>      > existing dbus visualizers such as bustle, my answer would be: it will
>      > present information in a way that's more relevant to the BMC, putting a
>      > bit more focus on BMC-specific DBus messages, such as HWMon and RedFish
>      > DBus messages, to present information in a high signal-noise ratio way.
>
> Would this need to run on the BMC itself?
>
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        | network architect  [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
>
