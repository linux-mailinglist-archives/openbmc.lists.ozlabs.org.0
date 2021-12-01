Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85644465554
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 19:25:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J46vS3DTgz3bZM
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 05:25:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rj1dEgW+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Rj1dEgW+; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J46v63Kp0z305K
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 05:24:48 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id t9so37310420wrx.7
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 10:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PJqv9cV+6A5Y8kg29ul6dm/sVtHBjuYgqSjc5AtLn8A=;
 b=Rj1dEgW+aezwS0JVVHSacfF3o6cdjJIV3sdKHLMKdhfN4l/Hj5Gf4GlI0Qla6yiIZ1
 g8nytXDq88zv01tEJl20lh6BHBdEoQ4mA7Ad8uzO9T8+af8ODlCytC9edf39D66Fjs2r
 MgAO6Lzi6MEDlScb+q5bmCANsESXV0AYlL/yI06RSwlPMAmPQEqZ+0p9Zq06ZeFjL9LM
 /Nsvs5mZX/uICUISgfye6jSm1btnmW248gbSdr4MB2uEeqIb7uKAT8G/okkGwjQNxu8J
 pXTGkF5Rqy7/8Mem8VHbOwl/cFIMGkOqn4vyo+5iOdr3MW16iN1vCyqxr8yMiMMvyJ3O
 9V8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PJqv9cV+6A5Y8kg29ul6dm/sVtHBjuYgqSjc5AtLn8A=;
 b=cB9BLAobsjEzDZiMTA/ZGu0dqFXDlvCyjwG6hf5VG1Ea088T4XzrC8gEnaeCZCb+5G
 tfWYz0FkvE5HQhCQEAfhvnSJDh0Y/XV4CBHorDhsQRmk7EgpQc6FSUvVBvzqX+5nc1QK
 kzTIpwioJyBsjsMbw1R9PS8SPUjvVEXVydwa8XiYe/IgPx5Ui2ZNnuJ+CZHIqnpcpp1g
 RMqbk2k3JTCfRGx6s0L7szmoHjV/DeBvCzB2PuSC9c3FIkw2LViNDVoZs32pCev2z1Ki
 5D3Z1yOVa2stndWl0MgkfSWkCTMTcE+eUfXwcIpu2hpFqlMAjVb/rcZajQVtxcgeohUq
 MXJw==
X-Gm-Message-State: AOAM533zjke/t+nnCz0KLN+EETiyJjcuJnDRaZa8XWTEuqwPNyKTU5u1
 ZXRo7O/hh40oMgPLCUy3ysuOM0Vz1DcnSAcpFEfqeA==
X-Google-Smtp-Source: ABdhPJxYqVxNp7zli5loXQeHCcJUTcX99NyFOlWkEeXYs13UvHzH0MHjreua2Qa7W2QeJ9GzG3pckTLvy5WpQesGWtU=
X-Received: by 2002:a5d:400e:: with SMTP id n14mr8317755wrp.368.1638383082707; 
 Wed, 01 Dec 2021 10:24:42 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 1 Dec 2021 10:24:31 -0800
Message-ID: <CAH2-KxDx2BwNMWaGvzUeQZVt4me5WSBvkni3A0ig-ohtxiWEUQ@mail.gmail.com>
Subject: Re: Implement Ethernet Interface Properties
To: =?UTF-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <spencer.ku@quantatw.com>
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
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 1, 2021 at 1:59 AM Spencer Ku (=E5=8F=A4=E4=B8=96=E7=91=9C) <Sp=
encer.Ku@quantatw.com> wrote:
>
> Hi All,
>
>
>
> We want to implement two network Ethernet interface properties =E2=80=9CB=
andwidth=E2=80=9D and =E2=80=9CDrop package rate=E2=80=9D, and expose the i=
nformation via Redfish. The goal is that clients can talk to bmc via Redfis=
h and get those two information. It will improve the debuggability of BMCs.
>

The only thing I would note in your plan is that Redfish generally
doesn't expose anything as a "rate", it exposes it as a count (packet
count, drop count), and lets the client determine whatever sampling
rate they want.  I suspect you should do the same.

Also, I'm assuming "drop package rate" was a typo for "dropped packets rate=
"?

>
>
> About the implement method, we divide the work into two parts: phosphor-n=
etwork(or other suitable service) part, and bmcweb part.
>
> For phosphor-network part, we propose to use existing tool like ipert to =
get the Ethernet BW/Drop package rate. Or the other method is that read TX/=
RX from ethernet driver (/sys/class/net/{Ethernet_Name}), then calculate th=
e BW/Drop package rate. After that, we will need to register the D-Bus inte=
rface and sync the property info to that D-Bus.
>
>
>
> For bmcweb part, as I know so far, there has no suitable field under the =
EthernetInterface to set BW/Drop package rate. The idea is that read the va=
lue from D-bus then set the properties under the EthernetInterface OEM fiel=
d. Please let me know if I have missed anything.

Considering that not all NICs will have this telemetry, it probably
makes sense to have it on a separate dbus interface.

>
>
>
> We are willing to see any suggestions and alternatives as well. Thanks!
>
>
>
> Sincerely,
>
> Spencer Ku
