Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6D107DB2
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 09:21:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KmVN1gvSzDrHl
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 19:21:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=mail.ru
 (client-ip=185.5.136.250; helo=fallback18.mail.ru;
 envelope-from=9165394577@mail.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mail.ru header.i=@mail.ru header.b="NCoNsCA/"; 
 dkim=pass (1024-bit key) header.d=mail.ru header.i=@mail.ru
 header.b="NCoNsCA/"; dkim-atps=neutral
Received: from fallback18.mail.ru (fallback18.mail.ru [185.5.136.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KmTd4KdwzDrFP
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 19:21:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=/Qg8cn77XmLtpYm1V2tI9kQMmEcpL9fT5TxHpHelw3U=; 
 b=NCoNsCA/Rxb0pwcCC92xMab5yeZ7mS4bGxa8bVY42n7YLJn+/G37qOKMxlvQZE76+3MtzBVc+NqxFIApmzcnfWtGHudaO6I/MfGamk4uMomF6zJL6g4cNPFYcpMm1kJXjROpzKwXq8/fjR839PsuQOgHZjJqn2Q1AfrN7SVIsEk=;
Received: from [10.161.64.45] (port=50102 helo=smtp37.i.mail.ru)
 by fallback18.m.smailru.net with esmtp (envelope-from <9165394577@mail.ru>)
 id 1iYQf9-0005mp-4V
 for openbmc@lists.ozlabs.org; Sat, 23 Nov 2019 11:21:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=/Qg8cn77XmLtpYm1V2tI9kQMmEcpL9fT5TxHpHelw3U=; 
 b=NCoNsCA/Rxb0pwcCC92xMab5yeZ7mS4bGxa8bVY42n7YLJn+/G37qOKMxlvQZE76+3MtzBVc+NqxFIApmzcnfWtGHudaO6I/MfGamk4uMomF6zJL6g4cNPFYcpMm1kJXjROpzKwXq8/fjR839PsuQOgHZjJqn2Q1AfrN7SVIsEk=;
Received: by smtp37.i.mail.ru with esmtpa (envelope-from <9165394577@mail.ru>)
 id 1iYQey-0000Lj-Gb; Sat, 23 Nov 2019 11:20:52 +0300
Subject: Re: NCSI eth0 (ftgmac100): transmit queue 0 timed out error
To: Andrew Jeffery <andrew@aj.id.au>
References: <2edbb697-aa07-2610-3bf2-cbd7707c6259@mail.ru>
 <2fa9a025-abf9-45f9-88bc-eddcc2726c89@www.fastmail.com>
 <9f3eaecd-6fec-8af8-21f6-8292c422593c@mail.ru>
 <e5994432-fcec-4994-a8bc-2ec46c103600@www.fastmail.com>
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lk=?= <9165394577@mail.ru>
Message-ID: <154200de-8eea-2204-e572-45d2f2fe6075@mail.ru>
Date: Sat, 23 Nov 2019 11:20:50 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e5994432-fcec-4994-a8bc-2ec46c103600@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: ru
X-77F55803: CF41D5CA8C6D3C0C7F9F52485CB584D786C548EC7EDDB2601C2F16DAD1125BB444EE74EAAFA5A97AD2E764E522F3840AF8D9167951635F18
X-7FA49CB5: 0D63561A33F958A51EBE414538A9E094AD55BA76CA77ED0DF839E6070E968EE38941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C224914053F143637FD2C76E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8B9189C45C6E258D8C3AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D725E5C173C3A84C31C82795A95DEC3B08644F08B9FE35F587649B479DD24E3CAC4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F9A3D58A9A349F5073B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: C939162F3547A0A25661E4D8897749B8660B0689028AC236114B1E6E5E3CB396E23824BA0C9766A7CD683AD8F64CCB9FCD26BA14935EF1A1EBB25DF8CDA217FBF24019644F7DBD5CCDD1A8804805D2EEC112642622160C5767EA787935ED9F1B
X-Mras: OK
X-77F55803: 5241C2F38277A35D7F9F52485CB584D7271FD7DF62800FDCA1D1BE06138BED921ED70CC46365BFBA65B899A2419CF950A215F2D0AE6F37D0
X-7FA49CB5: 0D63561A33F958A58E4C10D50CC46F79EA6BC23C2D9166FE728E727DF262015E8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249E534D5F67D1EC79B76E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8B0C576453C6160EE83AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D462275124DF8B9C975FAC89DD1A0FDCBE5BFE6E7EFDEDCD789D4C264860C145E
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C90051485E593308544757490A00DAB80ED851ED70CC46365BFBA44CC085085D1A849CD683AD8F64CCB9FCD26BA14935EF1A1EBB25DF8CDA217FBF24019644F7DBD5CCDD1A8804805D2EEC112642622160C5767EA787935ED9F1B
X-Mras: OK
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andrew,

It turned out that the i210 firmware was not loaded by the manufacturer. 
Maybe this is normal, but how then did they test the board?

Anyway, thanks for the help.

Sincerely,

Evgeniy

22.11.2019 3:50, Andrew Jeffery пишет:
> Hi Evgeniy,
>
> Please make sure to Reply-All or Cc openbmc@lists.ozlabs.org on your
> OpenBMC queries, that way others can learn from the discussion as well.
>
> On Fri, 15 Nov 2019, at 18:53, Евгений wrote:
>>   
>> Hello Andrew,
>>
>> It seems that I sent you not quite what you asked. Therefore, I send in
>> the attachment the final
>>
>> my_neptune_from_dtb.dts
>>
>> file made from the dtb file with the dtc utility, as well as the dtb itself.
>>
>> Maybe you will find pin conflicts in it. Thanks for the help anyway.
> Had a quick look but it would be better if you could send me the actual
> source rather than the DTS decompiled from a DTB. Do you have access
> to it?
>
> Regardless, can you please build and boot a kernel with
> CONFIG_DEBUG_PINCTRL=y and send me the full dmesg output of the
> booted system that shows your symptom?
>
> Cheers,
>
> Andrew
